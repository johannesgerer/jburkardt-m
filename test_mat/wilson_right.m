function a = wilson_right ( )

%*****************************************************************************80
%
%% WILSON_RIGHT returns the right eigenvectors of the WILSON matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(4,4), the right eigenvector matrix.
%
  a = [ ...
   0.380262074390714,   0.528567849528642, ...
   0.551954849631663,   0.520924780743657; ...
   0.396305561186082,   0.614861280394151, ...
  -0.271601039711768,  -0.625396181050490; ...
   0.093305039089285,  -0.301652326903523, ...
   0.760318430013036,  -0.567640668325261; ...
   0.830443752841578,  -0.501565058582058, ...
  -0.208553600252039,   0.123697458332363 ]';

  return
end
