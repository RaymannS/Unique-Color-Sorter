% Image Color Sorter
% Raymann Singh

% Initialization
clear, clc, close all
format long

while true
    % This prompts user for the file name until a correct file is given
    try
        fileName = askFile();
        fileData = imread(fileName);
        if exist("fileData","var")
            break
        end
    catch
        disp("Incorrect file name or extension")
        continue
    end
end

% This initializes the arrays to preallocate memory
[u,m,n] = unique(reshape(permute(fileData,[3,2,1]),3,[]).','rows');
counts = accumarray(n(:),1);
sz = zeros(numel(counts),1);
redRGB = zeros(1, numel(counts));
redTriplet = zeros(1, numel(counts));
greenRGB = zeros(1, numel(counts));
greenTriplet = zeros(1, numel(counts));
blueRGB = zeros(1, numel(counts));
blueTriplet = zeros(1, numel(counts));
x = u(:,1);
y = u(:,2);
z = u(:,3);
% End of initialization

progressBar = waitbar(0, 'Starting', 'CreateCancelBtn','delete(gcbf)');
for i=1:numel(counts)
    % This loop does a bunch of math to plot each unique pixel
    redRGB(i) = u(i,1);
    redTriplet(i) = round(redRGB(i)/255,3);
    % MATLAB uses triplets instead of RGB which is just the RGB value / 255
    greenRGB(i) = u(i,2);
    greenTriplet(i) = round(greenRGB(i)/255,3);
    blueRGB(i) = u(i,3);
    blueTriplet(i) = round(blueRGB(i)/255,3);
    sz(i) = transpose(round(counts(i),2));
    colorPlot = plot3(x(i,1),y(i,1),z(i,1), 'o', 'Color',[redTriplet(1,i) greenTriplet(1,i) blueTriplet(1,i)], 'MarkerSize',sz(i)./max(sz)*20);
    % Plot title and axis labels
    colorPlot.MarkerFaceColor = colorPlot.Color;
    title('Unique pixel colors and pixel density')
    xlabel('Red value for RGB value')
    ylabel('Green value for RGB value')
    zlabel('Blue value for RGB value')
    axis([0 255 0 255 0 255])
    grid on
    hold on
    if ~ishandle(progressBar)
        % This if statement stops the for loop if the cancel button is
        % pressed
        disp("Stopped graphing by user")
        delete(progressBar)
        break
    else
        waitbar(i/numel(counts), progressBar, sprintf('Iteration: %d Progress: %d %%', i, floor(i/numel(counts)*100)));
    end
    if i == numel(counts)
        % This if statement just closes the progress bar if the scatter
        % plot is done
        disp("Finished graphing colors")
        close(progressBar)
    end
end

[figureName,dataName] = outputFile(fileName,u);
disp("Outputed figure to files:")
disp(figureName)
disp(dataName)

% End of main code

function fileName = askFile()
    % This function asks for the file name
    prompt = "Input file name in png format (Ex: 'GreenRed.png'): ";
    fileName = input(prompt,'s');
end

function [figureName,dataName] = outputFile(fileName,u)
    % This function outputs the file that will contain the figure of the
    % unique colors and pixels
    % gcf means get current figure
    export = gcf;
    figureName = sprintf('unique_color_graph_%s', fileName);
    exportgraphics(export,figureName)
    newName = fileName(1:end-4);
    dataName = sprintf('unique_color_data_%s.txt',newName);
    writematrix(u,dataName)
end