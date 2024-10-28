-- =============================================================================
-- Main Scroll System
-- =============================================================================

-- =============================================================================
-- Function to handle scrolling the Frequency in and out.
-- @param X (number): The horizontal scroll amount.
-- @param Y (number): The vertical scroll amount.
-- =============================================================================
function Terrain:Scroll( X, Y )
   self.Config.Frequency = self.Config.Frequency + Y

   Hook:Call( 'Calculate' )
end

-- =============================================================================
-- Hooks
-- =============================================================================

Hook:Add( 'Wheel', 'Scroll', Terrain.Scroll, Terrain )