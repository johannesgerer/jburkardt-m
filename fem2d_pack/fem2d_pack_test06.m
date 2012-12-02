function fem2d_pack_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests DIV_Q4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  m = 21;
  n = 13;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  DIV_Q4 estimates divergence and vorticity\n' );
  fprintf ( 1, '  using 4 node quadrilateral elements.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Original U, V data forms %d rows and ', m );
  fprintf ( 1, '  %d columns.\n', n );
%
%  Set the nodes of the quadrilateral.
%
  q(1:2,1:4) = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 1.0; ...
    0.0, 1.0 ]';

  ilo = 5;
  jlo = 5;
  ihi = 8;
  jhi = 8;
%
%  Put dummy data into U and V at the data nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, J, X, Y, U(I,J), V(I,J)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m
    for j = 1 : n
      y(i,j) = ( ( m - i     ) * q(2,1)   ...
              + (     i - 1 ) * q(2,3) ) ...
            / ( m     - 1 );
      x(i,j) = ( ( n - j     ) * q(1,1)   ...
              + (     j - 1 ) * q(1,3) ) ...
              / ( n     - 1 );
    end
  end

  r8mat_print_some ( m, n, x, ilo, jlo, ihi, jhi, '  Some of X:' );
  r8mat_print_some ( m, n, y, ilo, jlo, ihi, jhi, '  Some of Y:' );

  for i = 1 : m
    for j = 1 : n
      u(i,j) = x(i,j) * y(i,j);
      v(i,j) = sin ( x(i,j) * x(i,j) + y(i,j) * y(i,j) );
    end
  end

  r8mat_print_some ( m, n, u, ilo, jlo, ihi, jhi, '  Some of U:' );
  r8mat_print_some ( m, n, v, ilo, jlo, ihi, jhi, '  Some of V:' );
%
%  Get DIV and VORT.
%
  [ div, vort ] = div_q4 ( m, n, u, v, q );
%
%  Compare computed and known values at the centers of the elements.
%
  for i = 1 : m-1
    for j = 1 : n-1
      ym(i,j) = ( ( 2 * m - 2 * i - 1 ) * q(2,1)   ...
                + (         2 * i - 1 ) * q(2,3) ) ...
                / ( 2 * m         - 2 );
      xm(i,j) = ( ( 2 * n - 2 * j - 1 ) * q(1,1)   ...
                + (         2 * j - 1 ) * q(1,3) ) ...
                / ( 2 * n         - 2 );
    end
  end

  r8mat_print_some ( m-1, n-1, xm, ilo, jlo, ihi, jhi, '  Some of XM:' );
  r8mat_print_some ( m-1, n-1, ym, ilo, jlo, ihi, jhi, '  Some of YM:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, J, DIV(I,J), Exact Divergence, Difference\n' );
  fprintf ( 1, '\n' );

  for i = ilo : ihi

    for j = jlo : jhi

      dudx = ym(i,j);
      dudy = xm(i,j);
      dvdx = 2.0 * xm(i,j) * cos ( xm(i,j) * xm(i,j) + ym(i,j) * ym(i,j) );
      dvdy = 2.0 * ym(i,j) * cos ( xm(i,j) * xm(i,j) + ym(i,j) * ym(i,j) );

      fprintf ( 1, '%4d  %4d  %7f  %7f  %12f  %12f  %12f\n', ...
        i, j, xm(i,j), ym(i,j), div(i,j), dudx + dvdy, ...
        div(i,j) - ( dudx + dvdy ) );

    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, J, VORT(I,J), Exact Vorticity, Difference\n' );
  fprintf ( 1, '\n' );

  for i = ilo : ihi

   for j = jlo : jhi

      dudx = ym(i,j);
      dudy = xm(i,j);
      dvdx = 2.0 * xm(i,j) * cos ( xm(i,j) * xm(i,j) + ym(i,j) * ym(i,j) );
      dvdy = 2.0 * ym(i,j) * cos ( xm(i,j) * xm(i,j) + ym(i,j) * ym(i,j) );

      fprintf ( 1, '%4d  %4d  %7f  %7f  %12f  %12f  %12f\n', ...
        i, j, xm(i,j), ym(i,j), vort(i,j), dvdx - dudy, ...
        vort(i,j) - ( dvdx - dudy ) );

    end
    fprintf ( 1, '\n' );
  end

  return
end
