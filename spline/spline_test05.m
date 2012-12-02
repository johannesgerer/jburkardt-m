function spline_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests BASIS_MATRIX_BEZIER, BASIS_MATRIX_TMP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author
%
%    John Burkardt
%
  n = 4;
  ndata = 4;
  nsample = 4;
  tdata = [ 0.0E+00, 0.0E+00, 1.0E+00, 1.0E+00 ]';
  ydata = [ 7.0E+00,  8.3333333E+00,   10.0E+00, 12.0E+00 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  BASIS_MATRIX_BEZIER sets up the basis\n' );
  fprintf ( 1, '    matrix for the uniform Bezier spline.\n' );

  mbasis = basis_matrix_bezier ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    TDATA, YDATA\n' );
  fprintf ( 1, '\n' );
  for i = 1 : ndata
    fprintf ( 1, '%12f  %12f\n', tdata(i), ydata(i) );
  end

  left = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '    T, Spline(T)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : ndata

    if ( i == 0 )
      tlo = tdata(1) - 0.5E+00 * ( tdata(2) - tdata(1) );
      thi = tdata(1);
    elseif ( i < ndata )
      tlo = tdata(i);
      thi = tdata(i+1);
    elseif ( ndata <= i )
      tlo = tdata(ndata);
      thi = tdata(ndata) + 0.5E+00 * ( tdata(ndata) - tdata(ndata-1) );
    end

    if ( i < ndata )
      jhi = nsample - 1;
    else
      jhi = nsample;
    end

    for j = 0 : jhi

      tval = ( ( nsample - j ) * tlo   ...
             + (           j ) * thi ) ...
             /   nsample;

      yval = basis_matrix_tmp ( left, n, mbasis, ndata, tdata, ydata, tval );

      if ( 0 < i & j == 0 )
        mark = '*';
      else
        mark = ' ';
      end

      fprintf ( 1, '%c  %12f  %12f\n', mark, tval, yval );

    end

  end

  return
end
