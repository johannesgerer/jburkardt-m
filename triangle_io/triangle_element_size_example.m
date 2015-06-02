function [ element_num, element_order, element_att_num ] = ...
  triangle_element_size_example ( )

%*****************************************************************************80
%
%% TRIANGLE_ELEMENT_SIZE_EXAMPLE returns element size information for the example.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer ELEMENT_NUM, the number of elements.
%
%    Output, integer ELEMENT_ORDER, the order of the elements.
%
%    Output, integer ELEMENT_ATT_NUM, the number of element 
%    attributes.
%
  element_num = 24;
  element_order = 3;
  element_att_num = 0;

  return
end
