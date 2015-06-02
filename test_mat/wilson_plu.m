function [ p, l, u ] = wilson_plu ( )

%*****************************************************************************80
%
%% WILSON_PLU returns the PLU factors of the WILSON matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real P(4,4), L(4,4), U(4,4), the PLU factors.
%

%
%  Note that matrix entries are listed by row.
%
  p = [ ...
    0.0,  0.0,  0.0,  1.0; ...
    1.0,  0.0,  0.0,  0.0; ...
    0.0,  1.0,  0.0,  0.0; ...
    0.0,  0.0,  1.0,  0.0 ];

  l = [ ...
   1.0,                0.00,  0.00,  0.00 ; ...
   0.857142857142857,  1.00,  0.00,  0.00 ; ...
   0.714285714285714,  0.25,  1.00,  0.00 ; ...
   0.714285714285714,  0.25, -0.20,  1.00 ];

  u = [ ...
    7.00, 10.0,               8.0,               7.00; ...
    0.00, -0.571428571428571, 3.142857142857143, 3.00; ...
    0.00,  0.0,               2.50,              4.25; ...
    0.00,  0.0,               0.0,               0.10 ];

  return
end
