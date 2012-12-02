function c = p06_carray ( )

%*****************************************************************************80
%
%% P06_CARRAY sets the C array.
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
%    Output, real C(5,8,8), the array of coefficients for the nonlinear
%    part of the aircraft stability function.
%
  c(1:5,1:8,1:8) = 0.0;

  c(1,2,3) = -   0.727;
  c(1,3,4) =     8.39;
  c(1,4,5) = - 684.4;
  c(1,4,7) =  + 63.5;

  c(2,1,3) =   + 0.949;
  c(2,1,5) =   + 0.173;

  c(3,1,2) =   - 0.716;
  c(3,1,4) =   - 1.578;
  c(3,4,7) =   + 1.132;

  c(4,1,5) =   - 1.0;

  c(5,1,4) =   + 1.0;

  return
end
