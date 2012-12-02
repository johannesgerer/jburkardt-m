function spline_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests BASIS_MATRIX_OVERHAUSER_NONUNI, BASIS_MATRIX_TMP.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  BASIS_MATRIX_OVERHAUSER_NONUNI sets up the\n' );
  fprintf ( 1, '    basis matrix for the nonuniform Overhauser\n' );
  fprintf ( 1, '    spline.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  First test that the nonuniform code can match\n' );
  fprintf ( 1, '  the uniform code.  Compare these results with\n' );
  fprintf ( 1, '  the uniform output.\n' );
  fprintf ( 1, '\n' );

  tdata(1:4) = [ -1.0E+00, 0.0E+00, 1.0E+00, 2.0E+00 ];

  alpha = ( tdata(3) - tdata(2) ) / ( tdata(3) - tdata(1) );
  beta =  ( tdata(3) - tdata(2) ) / ( tdata(4) - tdata(2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ALPHA = %14f\n', alpha );
  fprintf ( 1, '  BETA =  %14f\n', beta  );

  mbasis = basis_matrix_overhauser_nonuni ( alpha, beta );

  for i = 1 : ndata
    ydata(i) = ( tdata(i) + 2.0E+00 )^2 + 3.0E+00;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '    TDATA, YDATA\n' );
  fprintf ( 1, '\n' );
  for i = 1 : ndata
    fprintf ( 1, '%14f  %14f\n', tdata(i), ydata(i) );
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

      fprintf ( 1, '%c  %14f  %14f\n', mark, tval, yval );

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now test that the nonuniform code on a\n' );
  fprintf ( 1, '  nonuniform grid.\n' );
  fprintf ( 1, '\n' );

  tdata(1:4) = [ -4.0E+00, -3.0E+00, -1.0E+00, 2.0E+00 ];

  alpha = ( tdata(3) - tdata(2) ) / ( tdata(3) - tdata(1) );
  beta =  ( tdata(3) - tdata(2) ) / ( tdata(4) - tdata(2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ALPHA = %14f\n', alpha );
  fprintf ( 1, '  BETA =  %14f\n', beta  );

  mbasis = basis_matrix_overhauser_nonuni ( alpha, beta );

  for i = 1 : ndata
    ydata(i) = ( tdata(i) + 2.0E+00 )^2 + 3.0E+00;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '    TDATA, YDATA\n' );
  fprintf ( 1, '\n' );
  for i = 1 : ndata
    fprintf ( 1, '%14f  %14f\n', tdata(i), ydata(i) );
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

      fprintf ( 1, '%c  %14f  %14f\n', mark, tval, yval );

    end

  end

  return
end

