function colorSegmentation ( )

%% COLORSEGMENTATION segments the "fabric.jpg" image by color.
%
%    COLORSEGMENTATION displays a figure for each of the four segmented
%    colors: red, yellow, green, and magenta.
%
%  This function requires the Image Processing Toolbox.
%

%
%  Create a cell array of color names.
%
  colors = { 'red', 'yellow', 'green', 'magenta' };
%
%  Read the image.
%
  image = imread ( 'fabric.png' );

  imagesc ( image )
  title ( 'Original image to be color-filtered' )

  for index = 1: 4
%
% Each iteration will filter a different color
%
    filteredImage = colorFilter ( image, colors{index} );
%
%  Display the extracted segment.
%
    figure;
    imagesc ( filteredImage );
    title_string = sprintf ( 'Image filtered by %s', colors{index} );
    title ( title_string )

  end

  return
end
