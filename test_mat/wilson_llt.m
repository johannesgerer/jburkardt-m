function a = wilson_llt ( )

%*****************************************************************************80
%
%% WILSON_LLT returns the lower triangular Cholesky factor of the WILSON matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a = [ ...
   2.236067977499790,                0.0,                0.0,                0.0; ...
   3.130495168499706,  0.447213595499957,                0.0,                0.0; ...
   2.683281572999748, -0.894427190999918,  1.414213562373093,                0.0; ...
   2.236067977499790,                0.0,  2.121320343559645,  0.707106781186539 ];

  return
end
