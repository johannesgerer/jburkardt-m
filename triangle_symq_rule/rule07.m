function [ x, y, w ] = rule07 ( )

%*****************************************************************************80
%
%% RULE07 returns the rule of degree 7.
%
%  Discussion:
%
%    Order 7 (15 pts)
%    1/6 data for 7-th order quadrature with 4 nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Output, real X(*), Y(*), the coordinates of the nodes.
%
%    Output, real W(*), the weights.
%
  x = [ ...
       0.00000000000000000000000000000000, ...
       0.00000000000000000000000000000000, ...
      -0.43435077013834314810201324540358, ...
       0.00000000000000000000000000000000 ];
  y = [ ... ...
      -0.48449728984184861759282345604996, ...
       0.95448364011528521109785290893117, ...
      -0.49599375367952699580224212194439, ...
       0.31755324913853224106767424614158 ];
  w = [ ... ...
       0.34994956344512530405766865129365E-01, ...
       0.26925670356590145219766443119660E-01, ...
       0.73377101909709748747894757835629E-01, ...
       0.84047940214602985763108417548179E-01 ];

  return
end