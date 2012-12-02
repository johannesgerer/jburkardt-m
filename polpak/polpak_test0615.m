function polpak_test0615 ( )

%*****************************************************************************80
%
%% TEST0615 tests LERCH, LERCH_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0615:\n' );
  fprintf ( 1, '  LERCH evaluates the Lerch function.\n' );
  fprintf ( 1, '  LERCH_VALUES returns some tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       Z       S       A         Lerch           Lerch\n' );
  fprintf ( 1, '                             Tabulated        Computed\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, z, s, a, fx ] = lerch_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = lerch ( z, s, a );

    fprintf ( 1, '  %8f  %4d  %8f  %14e  %14e\n', z, s, a, fx, fx2 );

  end

  return
end
