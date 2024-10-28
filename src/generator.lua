-- =============================================================================
-- Main Generator System
-- =============================================================================

-- Pixels Table
local Pixels = { }

-- =============================================================================
-- Function to be used to get the elevation at a specific X and Y.
-- @param X (number): The X pixel.
-- @param Y (number): The Y pixel.
-- @return number: The elevation.
-- =============================================================================
function Terrain:GetPixel( X, Y )
   local Cache = Pixels[ Y ]

   if not Cache then 
      return nil
   end

   return Cache[ X ]
end

-- =============================================================================
-- Function to be used to get the color at a specific elevation.
-- @param Final (number): The elevation to calculate the color for.
-- @return table: The color table.
-- =============================================================================
function Terrain:GetColor( Final )
   local Config = self.Config

   if Final < 0.1 then 
      return Config.Palette[ 'Water' ]
   elseif Final < 0.4 then 
      return Config.Palette[ 'Beach' ]
   elseif Final < 0.5 then 
      return Config.Palette[ 'Forest' ]
   elseif Final < 1.0 then 
      return Config.Palette[ 'Jungle' ]
   end

   return Config.Palette[ 'Snow' ]
end

-- =============================================================================
-- Function to be used to generate the pixel map.
-- =============================================================================
function Terrain:Generate( )
   local Config = self.Config

   local Octave = {
      { Frequency = Config.Frequency, Amplitude = Config.Amplitude },
      { Frequency = Config.Frequency * 2, Amplitude = Config.Amplitude / 2 },
      { Frequency = Config.Frequency * 4, Amplitude = Config.Amplitude / 4 }
   }

   for X = 0, self.Width do
      for Y = 0, self.Height do
         Pixels[Y] = Pixels[Y] or {}

         local nX, nY = X / self.Width, Y / self.Height
         local Final = 0

         for k, v in ipairs( Octave ) do
            Final = Final + v.Amplitude * Noise( v.Frequency * nX, v.Frequency * nY )
         end

         Pixels[Y][X] = math.abs( Final ) / 0.7
      end
   end

end

-- =============================================================================
-- Hooks
-- =============================================================================

Hook:Add( 'Calculate', 'Generator', Terrain.Generate, Terrain )