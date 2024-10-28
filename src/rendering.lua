-- =============================================================================
-- Main Rendering System
-- =============================================================================

function Terrain:Render( )
   for X = 0, self.Width do
      for Y = 0, self.Height do
         love.graphics.setColor( unpack( self:GetColor( self:GetPixel( X, Y ) ) ) )
         love.graphics.rectangle( 'fill', X, Y, 1, 1 )
      end
   end
end

-- =============================================================================
-- Hooks
-- =============================================================================

Hook:Add( 'Render', 'Render', Terrain.Render, Terrain )