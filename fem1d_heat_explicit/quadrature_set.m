function [ quad_w, quad_x ] = quadrature_set ( quad_num )

%*****************************************************************************80
%
%% QUADRATURE_SET sets abscissas and weights for Gauss-Legendre quadrature.
%
%  Discussion:
%
%    The integration interval is [ -1, 1 ].
%
%    The weight function w(x) = 1.0;
%
%    The integral to approximate:
%
%      Integral ( -1 <= X <= 1 ) F(X) dX
%
%    Quadrature rule:
%
%      Sum ( 1 <= I <= QUAD_NUM ) QUAD_W(I) * F ( QUAD_X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer QUAD_NUM, the order of the rule.
%    QUAD_NUM must be between 1 and 6.
%
%    Output, real QUAD_W(QUAD_NUM), the weights of the rule.
%
%    Output, real QUAD_X(QUAD_NUM), the abscissas of the rule.
%
  if ( quad_num == 1 )

    quad_x(1) =   0.0;

    quad_w(1) = 2.0;

  elseif ( quad_num == 2 )

    quad_x(1) = - 0.577350269189625764509148780502;
    quad_x(2) =   0.577350269189625764509148780502;

    quad_w(1) = 1.0;
    quad_w(2) = 1.0;

  elseif ( quad_num == 3 )

    quad_x(1) = - 0.774596669241483377035853079956;
    quad_x(2) =   0.0;
    quad_x(3) =   0.774596669241483377035853079956;

    quad_w(1) = 5.0 / 9.0;
    quad_w(2) = 8.0 / 9.0;
    quad_w(3) = 5.0 / 9.0;

  elseif ( quad_num == 4 )

    quad_x(1) = - 0.861136311594052575223946488893;
    quad_x(2) = - 0.339981043584856264802665759103;
    quad_x(3) =   0.339981043584856264802665759103;
    quad_x(4) =   0.861136311594052575223946488893;

    quad_w(1) = 0.347854845137453857373063949222;
    quad_w(2) = 0.652145154862546142626936050778;
    quad_w(3) = 0.652145154862546142626936050778;
    quad_w(4) = 0.347854845137453857373063949222;

  elseif ( quad_num == 5 )

    quad_x(1) = - 0.906179845938663992797626878299;
    quad_x(2) = - 0.538469310105683091036314420700;
    quad_x(3) =   0.0;
    quad_x(4) =   0.538469310105683091036314420700;
    quad_x(5) =   0.906179845938663992797626878299;

    quad_w(1) = 0.236926885056189087514264040720;
    quad_w(2) = 0.478628670499366468041291514836;
    quad_w(3) = 0.568888888888888888888888888889;
    quad_w(4) = 0.478628670499366468041291514836;
    quad_w(5) = 0.236926885056189087514264040720;

  elseif ( quad_num == 6 )

    quad_x(1) = - 0.932469514203152027812301554494;
    quad_x(2) = - 0.661209386466264513661399595020;
    quad_x(3) = - 0.238619186083196908630501721681;
    quad_x(4) =   0.238619186083196908630501721681;
    quad_x(5) =   0.661209386466264513661399595020;
    quad_x(6) =   0.932469514203152027812301554494;

    quad_w(1) = 0.171324492379170345040296142173;
    quad_w(2) = 0.360761573048138607569833513838;
    quad_w(3) = 0.467913934572691047389870343990;
    quad_w(4) = 0.467913934572691047389870343990;
    quad_w(5) = 0.360761573048138607569833513838;
    quad_w(6) = 0.171324492379170345040296142173;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUADRATURE_SET - Fatal error!\n' );
    fprintf ( 1, '  The requested order %d is not available.\n', quad_num );
    error ( 'QUADRATURE_SET - Fatal error!' );

  end

  return
end
