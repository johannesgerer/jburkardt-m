function b = p06_barray ( )

%*****************************************************************************80
%
%% P06_BARRAY sets the B array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real B(5,8), the array of coefficients for the linear
%    part of the aircraft stability function.
%
  b_save = [ ...
    -3.933,  0.0,    0.002,  0.0,    0.0; ...
     0.107, -0.987,  0.0,    1.0,    0.0; ...
     0.126,  0.0,   -0.235,  0.0,   -1.0; ...
     0.0,  -22.95,   0.0,   -1.0,    0.0; ...
    -9.99,   0.0,    5.67,   0.0,   -0.196; ...
     0.0,  -28.37,   0.0,   -0.168,  0.0; ...
   -45.83,   0.0,   -0.921,  0.0,   -0.0071; ...
    -7.64,   0.0,   -6.51,   0.0,    0.0 ]';

  b(1:5,1:8) = b_save(1:5,1:8);

  return
end
