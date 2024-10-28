-- =============================================================================
-- Detours
-- =============================================================================

-- =============================================================================
-- Function to be used to override the default rendering function.
-- =============================================================================
function love.load( )
   -- Setup math.
   math.randomseed( os.time( ) )

   -- Get width & height.
   Terrain.Width, Terrain.Height = love.graphics.getDimensions( )

   Hook:Call( 'Initialize' )
end

-- =============================================================================
-- Function to be used to override the default think function.
-- @param Delta (number): The delta time of the callback.
-- =============================================================================
function love.update( Delta )
   Hook:Call( 'Think', Delta )
end

-- =============================================================================
-- Function to be used to override the default load function.
-- =============================================================================
function love.draw( )
   Hook:Call( 'Render' )
end