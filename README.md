# Read Me for Color Sorter
This program is a unique color sorter that detects the RGB value of each pixel in a .png image and counts how many of that exact RGB value pixel there are and displays a graph showing each unique RGB pixel and its respective pixel density
## Status
### [Released]
## Creator: Raymann Singh
### Created: 2022.11.28
## Last Editor: R. Singh
### Last Edited: 2022.12.2

## How to Use
Download the [Singh_Raymann_Color_Sorter.m] file and open it in MatLab.
Then insert any .png image into the same directory and folder that the [Singh_Raymann_Color_Sorter.m] file is located in.
Click the Run button in the Editor tab of the menu.
When prompted enter in the name of the .png file (Ex: 'GreenRed.png') without the quotes. (A sample image 'GreenRed.png' is provided in the .zip file)
A display will pop up with a progress bar, if you want to terminate the program you can click the cancel button.
Once finished or terminated an output .png file will be located in the same directory and folder as the [Singh_Raymann_Color_Sorter.m] file and will contain the figure that is currently displayed by MatLab.

### Bugs and updates
#### [0.1.2] - 2022.12.2
Changed plot from scatter to normal plot.
Improved size density function.
Added output in a comma delimited .txt files.
#### [0.1.1] - 2022.11.30 
Added outputFile() function to output to a .png file.
Optimized memory issues to run smoother.
#### [0.1.0] - 2022.11.29
Updated the scatter plot to show unique pixels and density.
Memory issues caused by large .png files.
#### [0.0.0] - 2022.11.28
Created initial user prompt and askFile() function.

## License
R. Singh, hereby disclaims all copyright interest in the program “Color Sorter” (which gathers unique pixel colors) written by R. Singh.

signature of R. Singh 28 November 2022
R. Singh, Owner

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.