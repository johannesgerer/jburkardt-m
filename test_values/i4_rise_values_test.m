function i4_rise_values_test ( )

%*****************************************************************************80
%
%% I4_RISE_VALUES_TEST demonstrates the use of I4_RISE_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_RISE_VALUES_TEST:\n' );
  fprintf ( 1, '  I4_RISE_VALUES returns some exact values\n' );
  fprintf ( 1, '  of the integer rising factorial function:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     M     N      I4_RISE(M,N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, m, n, fmn ] = i4_rise_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %10d\n', m, n, fmn );

  end

  return
end
