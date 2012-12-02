function [ xq, wq ] = gauss3pt ( )

%% GAUSSPT sets up a 3 point Gauss quadrature rule on [-1,1]
%
%  Modified:
%
%    09 November 2005
%
  xq(1) = -0.7745966692;
  xq(2) =  0.0;
  xq(3) =  0.7745966692;

  wq(1) = 0.5555555556;
  wq(2) = 0.8888888889;
  wq(3) = 0.5555555556;

  return
end
