function r8mat_trace_test ( )

%*****************************************************************************80
%
%% R8MAT_TRACE_TEST tests R8MAT_TRACE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  for i = 1 : n
    for j = 1 : n

      if ( i <= j )
        a(i,j) = n + 1 - j;
      elseif ( j == i - 1 )
        a(i,j) = n - j;
      else
        a(i,j) = 0.0;
      end

    end
  end
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_TRACE_TEST\n' );
  fprintf ( 1, '  R8MAT_TRACE computes the trace of a matrix\n' );

  r8mat_print ( n, n, a, '  Matrix:' );

  trace = r8mat_trace ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Trace is %f\n', trace );

  return
end
