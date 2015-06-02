function i4_is_triangular_test ( )

%*****************************************************************************80
%
%% I4_IS_TRIANGULAR_TEST tests I4_IS_TRIANGULAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_IS_TRIANGULAR_TEST\n' );
  fprintf ( 1, '  I4_IS_TRIANGULAR returns T or F depending on\n' );
  fprintf ( 1, '  whether I is triangular.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   T/F\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 20

    l = i4_is_triangular ( i );

    fprintf ( 1, '  %2d    %1d\n',  i, l );

  end

  return
end
