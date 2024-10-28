# Procedural Terrain Generator in Lua
A simple 2D procedural terrain generator built with Lua on the [LÖVE](https://www.love2d.org/wiki/Main_Page "LÖVE's main wiki") platform in just under 3 hours and 30 minutes for a self instituted game jam.

# Features
+ **Layered Noise:** Uses a multi-octave Simplex noise to create varied terrain elevation, texture, and color.
+ **Easy Customization:** Modify parameters to adjust biome types, map size, and noise properties from the main file config table.

# Prerequisites
  - [Lua](https://www.lua.org/) (5.1 or higher)
  - [LÖVE 2D](https://www.love2d.org/wiki/Main_Page)

# Installation
Clone this repository:
```
git clone https://github.com/ryanoutcome20/Procedural-2D-Terrain-Generator.git
cd Procedural-2D-Terrain-Generator
```

After cloing the repository and moving into the directory, run the command:
```
love .
```
###### Note that you may need to add the directory where LÖVE resides to your system's PATH variable, in order to be able to run it from the command line.

# Contributing
Contributions are okay! If you have any ideas for features or improvements, feel free to fork or submit a pull request. I will **not** be updating the main branch due to the time limitations.

## Future Ideas
If this project wasn't a three-hour game jam, I would add:
  + Real exploration with a true movement system
  + Randomized world based on hashed seed
  + Less linear more gradual terrain shift

**Very** large changes:
  + Caves and other underground areas to explore
  + Lighting
  + An actual game!
