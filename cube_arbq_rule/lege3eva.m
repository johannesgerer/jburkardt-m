function pols = lege3eva ( degree, z )

%*****************************************************************************80
%
%% LEGE3EVA evaluates orthonormal polynomials in the cube.
%
%  Discussion:
%
%    The number of polynomials is
%      NPOLS = ( ( DEGREE + 1 ) * ( DEGREE + 2 ) * ( DEGREE + 3 ) ) / 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DEGREE, the maximum degree.
%
%    Input, real Z(3), the evaluation point.
%
%    Output, real POLS(NPOLS), the polynomial values.
%
  pols = zeros ( ((degree+1)*(degree+2)*(degree+3))/6, 1 );

  f1 = llegepols1 ( degree, z(1) );
  f2 = llegepols1 ( degree, z(2) );
  f3 = llegepols1 ( degree, z(3) );

  kk = 0;
  for m = 0 : degree
    for n2 = 0 : m
      for n1 = 0 : n2
        kk = kk + 1;
        pols(kk) = f1(m-n2+1) * f2(n2-n1+1) * f3(n1+1);
        scale = 1.0E+00;
        t = 0.5E+00 * ( 1 + 2 * n1 );
        scale = scale * sqrt ( t );
        t = 0.5E+00 * ( 1 + 2 * n2 - 2 * n1 );
        scale = scale * sqrt ( t );
        t = 0.5E+00 * ( 1 + 2 * m - 2 * n2 );
        scale = scale * sqrt ( t );
        pols(kk) = pols(kk) * scale;
      end
    end
  end

  return
end
