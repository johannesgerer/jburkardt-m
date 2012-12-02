function segmented_image = colorFilter ( input_image, coi )

% Color-Based Segmentation Using the L*a*b* Color Space
% 'fabric.jpg', regioncoordinates.mat

% Identify the color of interest

  switch lower(coi)

    case 'red'
      coi_flag = 2;
    case 'green'
      coi_flag = 3;
    case 'purple'
      coi_flag = 4;
    case 'magenta'
      coi_flag = 5;
    case 'yellow'
      coi_flag = 6;
    otherwise
      error('Invalid Color.');
  end
%
% Calculate sample colors in L*a*b* color space for each region
%
% To simplify this demo, load the region coordinates that are stored in a
% MAT-file.
%
  load regioncoordinates;
%
% Identify the six colors in the image: background color, red, green,
% purple, yellow, and magenta. Use a mask to identify the regions for each
% color.
%
  sample_regions = roipoly ( input_image, region_coordinates(:,1,coi_flag),...
    region_coordinates(:,2,coi_flag) );
%
%  #ok  region_coordinates preloaded from file
%
% Convert your fabric RGB image into an L*a*b* image using MAKECFORM and
% APPLYCFORM. See help for more information on the use of these two
% functions.
%
  cform = makecform ( 'srgb2lab' );
  lab_fabric = applycform ( input_image, cform );
%
% Calculate the mean 'a*' and 'b*' value for each area that you extracted
% with roipoly. These values serve as your color markers in 'a*b*' space.
%
  a = lab_fabric(:,:,2);
  b = lab_fabric(:,:,3);

  color_markers = [mean2(a(sample_regions)), mean2(b(sample_regions))];
%
% Classify each pixel using the nearest neighbor rule
%
% Initialize matrices to be used in the nearest neighbor classification.
%
  a = double ( a );
  b = double ( b );
%
% Perform nearest neighbor rule classification
%
  distance = ( (a - color_markers(1)).^2 + (b - color_markers(2)).^2 ).^0.5;

  label = distance < 18;
%
% Display the results of the nearest neighbor classification.
%
%  The label matrix contains a color label for each pixel in the fabric image.
%
%  Use the label matrix to separate objects in the original fabric image by color.
%
  rgb_label = repmat ( label, [1 1 3] );

  color = input_image;
  color ( ~rgb_label ) = 0;
  segmented_image = color;

  return
end
