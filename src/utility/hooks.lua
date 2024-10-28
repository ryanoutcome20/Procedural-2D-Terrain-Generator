-- =============================================================================
-- Hooking System
-- =============================================================================

-- Main Table
Hook = { 
   Cache = { }
}

-- =============================================================================
-- Function to be used to add a new hook to the cache.
-- @param Event (string): The event we are going to hook. Case sensitive.
-- @param Identity (string): The identity of the event. Case sensitive.
-- @param Callback (function): The function to call when the event is called.
-- @param Meta (table): The meta to call the callback with. Optional. 
-- =============================================================================
function Hook:Add( Event, Identity, Callback, Meta )
   self.Cache[ Event ] = self.Cache[ Event ] or { }

   table.insert( self.Cache[ Event ], { Identity = Identity, Callback = Meta and function( ... )
      return Callback( Meta, ... )
   end or Callback } )
end

-- =============================================================================
-- Function to be used to remove a hook from the cache.
-- @param Event (table): The event of the callback we are going to unhook. Case sensitive.
-- @param Identity (table): The identity of the callback we are going to unhook. Case sensitive.
-- =============================================================================
function Hook:Remove( Event, Identity )
   local Pointer = self.Cache[ Event ]

   if not Pointer then 
      return 
   end

   for i = 1, #Pointer do 
      local Index = Pointer[ i ]

      if Index.Identity == Identity then 
         table.remove( Pointer, i )
      end
   end

   self.Cache[ Event ] = Pointer
end

-- =============================================================================
-- Function to be used to call a hook from within the cache.
-- @param Event (table): The event to call from cache.
-- @param varargs: The arguments to pass to the callbacks.
-- =============================================================================
function Hook:Call( Event, ... )
   local Pointer = self.Cache[ Event ]

   if not Pointer then 
      return 
   end

   for i = 1, #Pointer do 
      Pointer[ i ].Callback( ... )
   end
end