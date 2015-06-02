function [ ke, fe, we ] = r4_exp_setup ( )

%*****************************************************************************80
%
%% R4_EXP_SETUP sets data needed by R4_EXP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2013
%
%  Author:
%
%    Original C version by George Marsaglia, Wai Wan Tsang
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    George Marsaglia, Wai Wan Tsang,
%    The Ziggurat Method for Generating Random Variables,
%    Journal of Statistical Software,
%    Volume 5, Number 8, October 2000, seven pages.
%
%  Parameters:
%
%    Output, uint32 KE(256), data needed by R4_EXP.
%
%    Output, real FE(256), WE(256), data needed by R4_EXP.
%
  ke = zeros ( 256, 'uint32' );
  we = zeros ( 256 );
  fe = zeros ( 256 );

  m2 = 2147483648.0;
  ve = 3.949659822581572E-03;

  de = 7.697117470131487;
  te = 7.697117470131487;
  q = ve / exp ( - de );

  ke(1) = uint32 ( ( de / q ) * m2 );
  ke(2) = 0;

  we(1) = q / m2;
  we(256) = de / m2;

  fe(1) = 1.0;
  fe(256) = exp ( - de );

  for i = 255 : -1 : 2
    de = - log ( ve / de + exp ( - de ) );
    ke(i+1) = uint32 ( ( de / te ) * m2 );
    te = de;
    fe(i) = exp ( - de );
    we(i) = de / m2;
  end

  return
end
