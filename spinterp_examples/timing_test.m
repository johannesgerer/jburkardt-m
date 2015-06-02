function timing_test ( )

%*****************************************************************************80
%
%% TIMING_TEST times SPINTERP while constructing grids.
%
%  Discussion:
%
%    I am not sure that I am really asking for a sparse grid of a particular
%    level in the right way, nor that I am getting it.  The behavior of the
%    timing values seems, at least, plausible.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMING_TEST:\n' );
  fprintf ( 1, '  Measure the time required to compute the sparse grid\n' );
  fprintf ( 1, '  for a variety of dimensions and levels.\n' );
%
%  We need to have the spinterp program in the Matlab path.
%
  addpath ( '../spinterp' );

  OPTIONS = spset ( 'GridType', 'Chebyshev' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level Time table\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:' )
  for m = 1 : 10
    fprintf ( 1, '  %8d', m );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  l_max = 5;
  for l = 0 : l_max
%
%  Request a sparse grid of exactly depth L.
%
    OPTIONS = spset ( 'MinDepth', l, 'MaxDepth', l );

    fprintf ( 1, '   %2d', l );
    for m = 1 : 10
      tic;
      x = spgrid ( l, m, OPTIONS );
      t = toc;
      fprintf ( 1, '  %8.2g', t );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:' )
  for m = 11 : 20
    fprintf ( 1, '  %8d', m );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  l_max = 5;
  for l = 0 : l_max
%
%  Request a sparse grid of exactly depth L.
%
    OPTIONS = spset ( 'MinDepth', l, 'MaxDepth', l );

    fprintf ( 1, '   %2d', l );
    for m = 11 : 20
      tic;
      x = spgrid ( l, m, OPTIONS );
      t = toc;
      fprintf ( 1, '  %8.2g', t );
    end
    fprintf ( 1, '\n' );
  end

  rmpath ( '../spinterp' )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMING_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
