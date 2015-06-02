function a = kershaw_llt ( a )

%*****************************************************************************80
%
%% KERSHAW_LLT returns the Cholesky factor of the KERSHAW matrix.
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
  a = [ ...
    1.732050807568877,  0.0,                0.0,                0.0; ...
   -1.154700538379252,  1.290994448735805,  0.0,                0.0; ...
                  0.0, -1.549193338482967,  0.774596669241483,  0.0; ...
    1.154700538379252,  1.032795558988645, -0.516397779494321,  0.577350269189626 ];

  return
end
