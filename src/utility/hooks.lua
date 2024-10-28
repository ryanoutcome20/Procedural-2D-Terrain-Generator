-- =============================================================================
-- Hooking System
-- =============================================================================

-- Main Table
Hook = { 
   Cache = { }
}

-- =============================================================================
-- Function to be used to add a new hook to the cache.
-- @param Event (table): The event we are going to hook. Case sensitive.
-- @param Identity (table): 
-- @param Callback (function): 
-- =============================================================================
function Hook:Add( Event, Identity, Callback )
   self.Cache[ Event ] = self.Cache[ Event ] or { }

   table.insert( self.Cache[ Event ], { Identity = Identity, Callback = Callback } )
end

-- =============================================================================
-- Function to be used to add a new hook to the cache.
-- @param Event (table): The event of the callback we are going to unhook.
-- @param Identity (table): The identity of the callback we are going to unhook.
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
-- Function to be used to add a new hook to the cache.
-- @param Event (table): 
-- @param varargs: 
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