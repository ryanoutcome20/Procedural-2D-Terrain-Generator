-- Main Table
Terrain = { 
   Width  = 800,
   Height = 600,

   Config = {
      Frequency = 2,
      Amplitude = 1,

      Palette   = {
         [ 'Water' ] = { 0.53, 0.80, 0.92 },
         [ 'Beach' ] = { 0.88, 0.74, 0.57 },
         [ 'Forest' ] = { 0.19, 0.80, 0.19 },
         [ 'Jungle' ] = { 0.13, 0.51, 0.13 },
         [ 'Snow' ] = { 0.85, 0.85, 0.85 }
      }
   }
}

-- =============================================================================
-- Load External Libraries.
-- =============================================================================

Noise = require( 'src/external/noise' )

-- =============================================================================
-- Load Internal Files.
-- =============================================================================

require( 'src/utility/hooks' )
require( 'src/utility/detour' )

require( 'src/generator' )
require( 'src/rendering' )
require( 'src/scroll' )