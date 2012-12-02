function [ x, y, z, w ] = ld0770 ( )

%*****************************************************************************80
%
%% LD0770 computes the 770 point Lebedev angular grid.
%
%  Modified:
%
%    14 September 2010
%
%  Author:
%
%    Dmitri Laikov
%
%  Reference:
%
%    Vyacheslav Lebedev, Dmitri Laikov,
%    A quadrature formula for the sphere of the 131st
%    algebraic order of accuracy,
%    Russian Academy of Sciences Doklady Mathematics,
%    Volume 59, Number 3, 1999, pages 477-481.
%
%  Parameters:
%
%    Output, real X(N), Y(N), Z(N), W(N), the coordinates
%    and weights of the points.
%
  n = 0;
  x = zeros(770,1);
  y = zeros(770,1);
  z = zeros(770,1);
  w = zeros(770,1);
  a = 0.0;
  b = 0.0;
  v = 0.2192942088181184E-03;
  [ n, x, y, z, w ] = gen_oh ( 1, n, a, b, v, x, y, z, w );
  v = 0.1436433617319080E-02;
  [ n, x, y, z, w ] = gen_oh ( 2, n, a, b, v, x, y, z, w );
  v = 0.1421940344335877E-02;
  [ n, x, y, z, w ] = gen_oh ( 3, n, a, b, v, x, y, z, w );
  a = 0.5087204410502360E-01;
  v = 0.6798123511050502E-03;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.1228198790178831;
  v = 0.9913184235294912E-03;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.2026890814408786;
  v = 0.1180207833238949E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.2847745156464294;
  v = 0.1296599602080921E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.3656719078978026;
  v = 0.1365871427428316E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.4428264886713469;
  v = 0.1402988604775325E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.5140619627249735;
  v = 0.1418645563595609E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6306401219166803;
  v = 0.1421376741851662E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6716883332022612;
  v = 0.1423996475490962E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.6979792685336881;
  v = 0.1431554042178567E-02;
  [ n, x, y, z, w ] = gen_oh ( 4, n, a, b, v, x, y, z, w );
  a = 0.1446865674195309;
  v = 0.9254401499865368E-03;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.3390263475411216;
  v = 0.1250239995053509E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.5335804651263506;
  v = 0.1394365843329230E-02;
  [ n, x, y, z, w ] = gen_oh ( 5, n, a, b, v, x, y, z, w );
  a = 0.6944024393349413E-01;
  b = 0.2355187894242326;
  v = 0.1127089094671749E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.2269004109529460;
  b = 0.4102182474045730;
  v = 0.1345753760910670E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.8025574607775339E-01;
  b = 0.6214302417481605;
  v = 0.1424957283316783E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.1467999527896572;
  b = 0.3245284345717394;
  v = 0.1261523341237750E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.1571507769824727;
  b = 0.5224482189696630;
  v = 0.1392547106052696E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.2365702993157246;
  b = 0.6017546634089558;
  v = 0.1418761677877656E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.7714815866765732E-01;
  b = 0.4346575516141163;
  v = 0.1338366684479554E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.3062936666210730;
  b = 0.4908826589037616;
  v = 0.1393700862676131E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  a = 0.3822477379524787;
  b = 0.5648768149099500;
  v = 0.1415914757466932E-02;
  [ n, x, y, z, w ] = gen_oh ( 6, n, a, b, v, x, y, z, w );
  
  return
end
