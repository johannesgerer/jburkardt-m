function spline_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests BASIS_FUNCTION_B_VAL.
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
  ndata = 5;
  nsample = 4;
  tdata = [ 0.0E+00, 1.0E+00, 4.0E+00, 6.0E+00, 10.0E+00 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  BASIS_FUNCTION_B_VAL evaluates the \n' );
  fprintf ( 1, '    B spline basis function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    T            B(T)\n' );
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
             / ( nsample     );

      yval = basis_function_b_val ( tdata, tval );

      if ( 0 < i & j == 0 )
        mark = '*';
      else
        mark = ' ';
      end

      fprintf ( '%c%12f  %12f\n', mark, tval, yval );

    end

  end

  return
end
