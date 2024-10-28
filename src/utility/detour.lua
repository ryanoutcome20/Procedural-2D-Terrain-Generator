-- =============================================================================
-- Detour System
-- =============================================================================

-- =============================================================================
-- Function to be used to override the default rendering function.
-- =============================================================================
function love.load( )
   -- Setup math.
   math.randomseed( os.time( ) )

   -- Get width & height.
   Terrain.Width, Terrain.Height = love.graphics.getDimensions( )

   Hook:Call( 'Calculate' )
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

-- =============================================================================
-- Function to be used to override the default load function.
-- @param Y (number): Amount of horizontal mouse wheel movement. Positive values indicate movement to the right.
-- @param X (number): Amount of vertical mouse wheel movement. Positive values indicate upward movement.
-- =============================================================================
function love.wheelmoved( X, Y )
   Hook:Call( 'Wheel', X, Y )
end

