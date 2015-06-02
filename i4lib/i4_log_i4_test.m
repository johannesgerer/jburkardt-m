function i4_log_i4_test ( )

%*****************************************************************************80
%
%% I4_LOG_I4_TEST tests I4_LOG_I4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_LOG_I4_TEST\n' );
  fprintf ( 1, '  I4_LOG_I4: logarith of I4 base J4,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I4        J4 I4_LOG_I4\n' );
  fprintf ( 1, '\n' );

  for j4 = 2 : 5
    for i4 = 0 : 10
      fprintf ( 1, '  %8d  %8d  %8d\n', i4, j4, i4_log_i4 ( i4, j4 ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
