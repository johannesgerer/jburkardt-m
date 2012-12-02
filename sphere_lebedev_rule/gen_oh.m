function [ n, x, y, z, w ] = gen_oh ( code, n, a, b, v, x, y, z, w )

%*****************************************************************************80
%
%% GEN_OH generates points under OH symmetry.
%
%  Discussion:
%
%    Given a point on a sphere, specified by A and B, this routine generates
%    all the equivalent points under OH symmetry, making grid points with
%    weight V.
%
%    The variable NUM is increased by the number of different points
%    generated.
%
%    Depending on CODE, there are from 6 to 48 different but equivalent
%    points that are generated:
%
%      CODE=1:   (0,0,1) etc                                (  6 points)
%      CODE=2:   (0,A,A) etc, A=1/sqrt(2)                   ( 12 points)
%      CODE=3:   (A,A,A) etc, A=1/sqrt(3)                   (  8 points)
%      CODE=4:   (A,A,B) etc, B=sqrt(1-2 A^2)               ( 24 points)
%      CODE=5:   (A,B,0) etc, B=sqrt(1-A^2), A input        ( 24 points)
%      CODE=6:   (A,B,C) etc, C=sqrt(1-A^2-B^2), A, B input ( 48 points)
%
%  Modified:
%
%    11 September 2010
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
%    Input, integer CODE, selects the symmetry group.
%
%    Input, integer N, the total number of points.
%
%    Input, real A, B, information that may be needed to
%    generate the coordinates of the points (for code = 5 or 6 only).
%
%    Input, real V, the weight to be assigned the points.
%
%    Input, real X(N), Y(N), Z(N), W(N), the coordinates
%    and weights of the symmetric points generated on this call.
%
%    Output, integer N, the total number of points.  
%
%    Output, real X(N), Y(N), Z(N), W(N), the coordinates and weights.
%
  if ( code == 1 )

    a = 1.00;
    x(n+1) =  a;
    y(n+1) =  0.00;
    z(n+1) =  0.00;
    w(n+1) =  v;
    x(n+2) = -a;
    y(n+2) =  0.00;
    z(n+2) =  0.00;
    w(n+2) =  v;
    x(n+3) =  0.00;
    y(n+3) =  a;
    z(n+3) =  0.00;
    w(n+3) =  v;
    x(n+4) =  0.00;
    y(n+4) = -a;
    z(n+4) =  0.00;
    w(n+4) =  v;
    x(n+5) =  0.00;
    y(n+5) =  0.00;
    z(n+5) =  a;
    w(n+5) =  v;
    x(n+6) =  0.00;
    y(n+6) =  0.00;
    z(n+6) = -a;
    w(n+6) =  v;
    n = n + 6;

  elseif ( code == 2 )

    a = sqrt ( 0.50 );
    x(n+ 1) =  0.00;
    y(n+ 1) =  a;
    z(n+ 1) =  a;
    w(n+ 1) =  v;
    x(n+ 2) =  0.00;
    y(n+ 2) = -a;
    z(n+ 2) =  a;
    w(n+ 2) =  v;
    x(n+ 3) =  0.00;
    y(n+ 3) =  a;
    z(n+ 3) = -a;
    w(n+ 3) =  v;
    x(n+ 4) =  0.00;
    y(n+ 4) = -a;
    z(n+ 4) = -a;
    w(n+ 4) =  v;
    x(n+ 5) =  a;
    y(n+ 5) =  0.00;
    z(n+ 5) =  a;
    w(n+ 5) =  v;
    x(n+ 6) = -a;
    y(n+ 6) =  0.00;
    z(n+ 6) =  a;
    w(n+ 6) =  v;
    x(n+ 7) =  a;
    y(n+ 7) =  0.00;
    z(n+ 7) = -a;
    w(n+ 7) =  v;
    x(n+ 8) = -a;
    y(n+ 8) =  0.00;
    z(n+ 8) = -a;
    w(n+ 8) =  v;
    x(n+ 9) =  a;
    y(n+ 9) =  a;
    z(n+ 9) =  0.00;
    w(n+ 9) =  v;
    x(n+10) = -a;
    y(n+10) =  a;
    z(n+10) =  0.00;
    w(n+10) =  v;
    x(n+11) =  a;
    y(n+11) = -a;
    z(n+11) =  0.00;
    w(n+11) =  v;
    x(n+12) = -a;
    y(n+12) = -a;
    z(n+12) =  0.00;
    w(n+12) =  v;
    n = n + 12;

  elseif ( code == 3 )

    a = sqrt ( 1.00 / 3.00 );
    x(n+1) =  a;
    y(n+1) =  a;
    z(n+1) =  a;
    w(n+1) =  v;
    x(n+2) = -a;
    y(n+2) =  a;
    z(n+2) =  a;
    w(n+2) =  v;
    x(n+3) =  a;
    y(n+3) = -a;
    z(n+3) =  a;
    w(n+3) =  v;
    x(n+4) = -a;
    y(n+4) = -a;
    z(n+4) =  a;
    w(n+4) =  v;
    x(n+5) =  a;
    y(n+5) =  a;
    z(n+5) = -a;
    w(n+5) =  v;
    x(n+6) = -a;
    y(n+6) =  a;
    z(n+6) = -a;
    w(n+6) =  v;
    x(n+7) =  a;
    y(n+7) = -a;
    z(n+7) = -a;
    w(n+7) =  v;
    x(n+8) = -a;
    y(n+8) = -a;
    z(n+8) = -a;
    w(n+8) =  v;
    n = n + 8;

  elseif ( code == 4 )

    b = sqrt ( 1.00 - 2.00 * a * a );
    x(n+ 1) =  a;
    y(n+ 1) =  a;
    z(n+ 1) =  b;
    w(n+ 1) =  v;
    x(n+ 2) = -a;
    y(n+ 2) =  a;
    z(n+ 2) =  b;
    w(n+ 2) =  v;
    x(n+ 3) =  a;
    y(n+ 3) = -a;
    z(n+ 3) =  b;
    w(n+ 3) =  v;
    x(n+ 4) = -a;
    y(n+ 4) = -a;
    z(n+ 4) =  b;
    w(n+ 4) =  v;
    x(n+ 5) =  a;
    y(n+ 5) =  a;
    z(n+ 5) = -b;
    w(n+ 5) =  v;
    x(n+ 6) = -a;
    y(n+ 6) =  a;
    z(n+ 6) = -b;
    w(n+ 6) =  v;
    x(n+ 7) =  a;
    y(n+ 7) = -a;
    z(n+ 7) = -b;
    w(n+ 7) =  v;
    x(n+ 8) = -a;
    y(n+ 8) = -a;
    z(n+ 8) = -b;
    w(n+ 8) =  v;
    x(n+ 9) =  a;
    y(n+ 9) =  b;
    z(n+ 9) =  a;
    w(n+ 9) =  v;
    x(n+10) = -a;
    y(n+10) =  b;
    z(n+10) =  a;
    w(n+10) =  v;
    x(n+11) =  a;
    y(n+11) = -b;
    z(n+11) =  a;
    w(n+11) =  v;
    x(n+12) = -a;
    y(n+12) = -b;
    z(n+12) =  a;
    w(n+12) =  v;
    x(n+13) =  a;
    y(n+13) =  b;
    z(n+13) = -a;
    w(n+13) =  v;
    x(n+14) = -a;
    y(n+14) =  b;
    z(n+14) = -a;
    w(n+14) =  v;
    x(n+15) =  a;
    y(n+15) = -b;
    z(n+15) = -a;
    w(n+15) =  v;
    x(n+16) = -a;
    y(n+16) = -b;
    z(n+16) = -a;
    w(n+16) =  v;
    x(n+17) =  b;
    y(n+17) =  a;
    z(n+17) =  a;
    w(n+17) =  v;
    x(n+18) = -b;
    y(n+18) =  a;
    z(n+18) =  a;
    w(n+18) =  v;
    x(n+19) =  b;
    y(n+19) = -a;
    z(n+19) =  a;
    w(n+19) =  v;
    x(n+20) = -b;
    y(n+20) = -a;
    z(n+20) =  a;
    w(n+20) =  v;
    x(n+21) =  b;
    y(n+21) =  a;
    z(n+21) = -a;
    w(n+21) =  v;
    x(n+22) = -b;
    y(n+22) =  a;
    z(n+22) = -a;
    w(n+22) =  v;
    x(n+23) =  b;
    y(n+23) = -a;
    z(n+23) = -a;
    w(n+23) =  v;
    x(n+24) = -b;
    y(n+24) = -a;
    z(n+24) = -a;
    w(n+24) =  v;
    n = n + 24;

  elseif ( code == 5 )

    b = sqrt ( 1.00 - a * a );
    x(n+ 1) =  a;
    y(n+ 1) =  b;
    z(n+ 1) =  0.00;
    w(n+ 1) =  v;
    x(n+ 2) = -a;
    y(n+ 2) =  b;
    z(n+ 2) =  0.00;
    w(n+ 2) =  v;
    x(n+ 3) =  a;
    y(n+ 3) = -b;
    z(n+ 3) =  0.00;
    w(n+ 3) =  v;
    x(n+ 4) = -a;
    y(n+ 4) = -b;
    z(n+ 4) =  0.00;
    w(n+ 4) =  v;
    x(n+ 5) =  b;
    y(n+ 5) =  a;
    z(n+ 5) =  0.00;
    w(n+ 5) =  v;
    x(n+ 6) = -b;
    y(n+ 6) =  a;
    z(n+ 6) =  0.00;
    w(n+ 6) =  v;
    x(n+ 7) =  b;
    y(n+ 7) = -a;
    z(n+ 7) =  0.00;
    w(n+ 7) =  v;
    x(n+ 8) = -b;
    y(n+ 8) = -a;
    z(n+ 8) =  0.00;
    w(n+ 8) =  v;
    x(n+ 9) =  a;
    y(n+ 9) =  0.00;
    z(n+ 9) =  b;
    w(n+ 9) =  v;
    x(n+10) = -a;
    y(n+10) =  0.00;
    z(n+10) =  b;
    w(n+10) =  v;
    x(n+11) =  a;
    y(n+11) =  0.00;
    z(n+11) = -b;
    w(n+11) =  v;
    x(n+12) = -a;
    y(n+12) =  0.00;
    z(n+12) = -b;
    w(n+12) =  v;
    x(n+13) =  b;
    y(n+13) =  0.00;
    z(n+13) =  a;
    w(n+13) =  v;
    x(n+14) = -b;
    y(n+14) =  0.00;
    z(n+14) =  a;
    w(n+14) =  v;
    x(n+15) =  b;
    y(n+15) =  0.00;
    z(n+15) = -a;
    w(n+15) =  v;
    x(n+16) = -b;
    y(n+16) =  0.00;
    z(n+16) = -a;
    w(n+16) =  v;
    x(n+17) =  0.00;
    y(n+17) =  a;
    z(n+17) =  b;
    w(n+17) =  v;
    x(n+18) =  0.00;
    y(n+18) = -a;
    z(n+18) =  b;
    w(n+18) =  v;
    x(n+19) =  0.00;
    y(n+19) =  a;
    z(n+19) = -b;
    w(n+19) =  v;
    x(n+20) =  0.00;
    y(n+20) = -a;
    z(n+20) = -b;
    w(n+20) =  v;
    x(n+21) =  0.00;
    y(n+21) =  b;
    z(n+21) =  a;
    w(n+21) =  v;
    x(n+22) =  0.00;
    y(n+22) = -b;
    z(n+22) =  a;
    w(n+22) =  v;
    x(n+23) =  0.00;
    y(n+23) =  b;
    z(n+23) = -a;
    w(n+23) =  v;
    x(n+24) =  0.00;
    y(n+24) = -b;
    z(n+24) = -a;
    w(n+24) =  v;
    n = n + 24;

  elseif ( code == 6 )

    c = sqrt ( 1.00 - a * a - b * b );
    x(n+ 1) =  a;
    y(n+ 1) =  b;
    z(n+ 1) =  c;
    w(n+ 1) =  v;
    x(n+ 2) = -a;
    y(n+ 2) =  b;
    z(n+ 2) =  c;
    w(n+ 2) =  v;
    x(n+ 3) =  a;
    y(n+ 3) = -b;
    z(n+ 3) =  c;
    w(n+ 3) =  v;
    x(n+ 4) = -a;
    y(n+ 4) = -b;
    z(n+ 4) =  c;
    w(n+ 4) =  v;
    x(n+ 5) =  a;
    y(n+ 5) =  b;
    z(n+ 5) = -c;
    w(n+ 5) =  v;
    x(n+ 6) = -a;
    y(n+ 6) =  b;
    z(n+ 6) = -c;
    w(n+ 6) =  v;
    x(n+ 7) =  a;
    y(n+ 7) = -b;
    z(n+ 7) = -c;
    w(n+ 7) =  v;
    x(n+ 8) = -a;
    y(n+ 8) = -b;
    z(n+ 8) = -c;
    w(n+ 8) =  v;
    x(n+ 9) =  a;
    y(n+ 9) =  c;
    z(n+ 9) =  b;
    w(n+ 9) =  v;
    x(n+10) = -a;
    y(n+10) =  c;
    z(n+10) =  b;
    w(n+10) =  v;
    x(n+11) =  a;
    y(n+11) = -c;
    z(n+11) =  b;
    w(n+11) =  v;
    x(n+12) = -a;
    y(n+12) = -c;
    z(n+12) =  b;
    w(n+12) =  v;
    x(n+13) =  a;
    y(n+13) =  c;
    z(n+13) = -b;
    w(n+13) =  v;
    x(n+14) = -a;
    y(n+14) =  c;
    z(n+14) = -b;
    w(n+14) =  v;
    x(n+15) =  a;
    y(n+15) = -c;
    z(n+15) = -b;
    w(n+15) =  v;
    x(n+16) = -a;
    y(n+16) = -c;
    z(n+16) = -b;
    w(n+16) =  v;
    x(n+17) =  b;
    y(n+17) =  a;
    z(n+17) =  c;
    w(n+17) =  v;
    x(n+18) = -b;
    y(n+18) =  a;
    z(n+18) =  c;
    w(n+18) =  v;
    x(n+19) =  b;
    y(n+19) = -a;
    z(n+19) =  c;
    w(n+19) =  v;
    x(n+20) = -b;
    y(n+20) = -a;
    z(n+20) =  c;
    w(n+20) =  v;
    x(n+21) =  b;
    y(n+21) =  a;
    z(n+21) = -c;
    w(n+21) =  v;
    x(n+22) = -b;
    y(n+22) =  a;
    z(n+22) = -c;
    w(n+22) =  v;
    x(n+23) =  b;
    y(n+23) = -a;
    z(n+23) = -c;
    w(n+23) =  v;
    x(n+24) = -b;
    y(n+24) = -a;
    z(n+24) = -c;
    w(n+24) =  v;
    x(n+25) =  b;
    y(n+25) =  c;
    z(n+25) =  a;
    w(n+25) =  v;
    x(n+26) = -b;
    y(n+26) =  c;
    z(n+26) =  a;
    w(n+26) =  v;
    x(n+27) =  b;
    y(n+27) = -c;
    z(n+27) =  a;
    w(n+27) =  v;
    x(n+28) = -b;
    y(n+28) = -c;
    z(n+28) =  a;
    w(n+28) =  v;
    x(n+29) =  b;
    y(n+29) =  c;
    z(n+29) = -a;
    w(n+29) =  v;
    x(n+30) = -b;
    y(n+30) =  c;
    z(n+30) = -a;
    w(n+30) =  v;
    x(n+31) =  b;
    y(n+31) = -c;
    z(n+31) = -a;
    w(n+31) =  v;
    x(n+32) = -b;
    y(n+32) = -c;
    z(n+32) = -a;
    w(n+32) =  v;
    x(n+33) =  c;
    y(n+33) =  a;
    z(n+33) =  b;
    w(n+33) =  v;
    x(n+34) = -c;
    y(n+34) =  a;
    z(n+34) =  b;
    w(n+34) =  v;
    x(n+35) =  c;
    y(n+35) = -a;
    z(n+35) =  b;
    w(n+35) =  v;
    x(n+36) = -c;
    y(n+36) = -a;
    z(n+36) =  b;
    w(n+36) =  v;
    x(n+37) =  c;
    y(n+37) =  a;
    z(n+37) = -b;
    w(n+37) =  v;
    x(n+38) = -c;
    y(n+38) =  a;
    z(n+38) = -b;
    w(n+38) =  v;
    x(n+39) =  c;
    y(n+39) = -a;
    z(n+39) = -b;
    w(n+39) =  v;
    x(n+40) = -c;
    y(n+40) = -a;
    z(n+40) = -b;
    w(n+40) =  v;
    x(n+41) =  c;
    y(n+41) =  b;
    z(n+41) =  a;
    w(n+41) =  v;
    x(n+42) = -c;
    y(n+42) =  b;
    z(n+42) =  a;
    w(n+42) =  v;
    x(n+43) =  c;
    y(n+43) = -b;
    z(n+43) =  a;
    w(n+43) =  v;
    x(n+44) = -c;
    y(n+44) = -b;
    z(n+44) =  a;
    w(n+44) =  v;
    x(n+45) =  c;
    y(n+45) =  b;
    z(n+45) = -a;
    w(n+45) =  v;
    x(n+46) = -c;
    y(n+46) =  b;
    z(n+46) = -a;
    w(n+46) =  v;
    x(n+47) =  c;
    y(n+47) = -b;
    z(n+47) = -a;
    w(n+47) =  v;
    x(n+48) = -c;
    y(n+48) = -b;
    z(n+48) = -a;
    w(n+48) =  v;
    n = n + 48;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEN_OH - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of CODE.\n' );
    error ( 'GEN_OH - Fatal error!' );
 
  end

  return
end