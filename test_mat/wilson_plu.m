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
%    28 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real ( kind = 8 ) P(4,4), L(4,4), U(4,4), the PLU factors.
%
  l = [
   1.0, 0.857142857142857, 0.714285714285714, 0.714285714285714; ...
   0.0, 1.00,              0.25,              0.25; ...
   0.0, 0.00,              1.0,              -0.20; ...
   0.0, 0.00,              0.0,               1.00 ]';

  p = [
    0.0,  1.0,  0.0,  0.0; ...
    0.0,  0.0,  1.0,  0.0; ...
    0.0,  0.0,  0.0,  1.0; ...
    1.0,  0.0,  0.0,  0.0 ]';

  u = [
    7.0,  0.00,               0.00,  0.0; ...
   10.0, -0.571428571428571,  0.00,  0.0; ...
    8.0,  3.142857142857143,  2.50,  0.0; ...
    7.0,  3.00,               4.25,  0.10 ]';

  return
end
