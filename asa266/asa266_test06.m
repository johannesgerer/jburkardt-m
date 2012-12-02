function asa266_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests GAMAIN, GAMMDS, GAMMAD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2010
%
%  Author:
%
%    John Burkardt
%
  ntest = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  GAMAIN,\n' );
  fprintf ( 1, '  GAMMDS and \n' );
  fprintf ( 1, '  GAMMAD compute the incomplete Gamma integral.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X  P  GAMMDS  GAMMAD  GAMAIN\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    x = i / ntest;

    fprintf ( 1, '\n' );

    for j = 1 : ntest

      p = j / ntest;
      [ g1, ifault ] = gammds ( x, p );
      if ( ifault ~= 0 )
        g1 = -99.0;
      end

      [ g2, ifault ] = gammad ( x, p );
      if ( ifault ~= 0 )
        g2 = -99.0;
      end

      [ g3, ifault ] = gamain ( x, p );
      if ( ifault ~= 0 )
        g3 = - 99.0;
      end

      fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f\n', x, p, g1, g2, g3 );

    end

  end

  return
end
