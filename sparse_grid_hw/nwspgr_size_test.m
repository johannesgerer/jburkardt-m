function nwspgr_size_test ( )

%*****************************************************************************80
%
%% NWSPGR_SIZE_TEST tests NWSPGR_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NWSPGR_SIZE_TEST:\n' );
  fprintf ( 1, '  NWSPGR_SIZE returns the size of a sparse grid, based on:\n' );
  fprintf ( 1, '  one of the built-in 1D rules, or a family of 1D rules\n' );
  fprintf ( 1, '  supplied by the user.\n' );

  d = 2;
  k = 3;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Kronrod-Patterson, [0,1], Dim %d, Level %d Symmetric\n', d, k );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full          %4d\n', nwspgr_size ( 'kpu', d, k, 1, 0 ) );
  fprintf ( 1, '  Compressed    %4d\n', nwspgr_size ( 'kpu', d, k, 1, 1 ) );

  d = 2;
  k = 3;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Kronrod-Patterson, (-oo,+oo), Dim %d, Level %d Symmetric\n', d, k );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full          %4d\n', nwspgr_size ( 'kpn', d, k, 1, 0 ) );
  fprintf ( 1, '  Compressed    %4d\n', nwspgr_size ( 'kpn', d, k, 1, 1 ) );

  d = 2;
  k = 3;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Gauss-Legendre, [0,1], Dim %d, Level %d Symmetric\n', d, k );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full          %4d\n', nwspgr_size ( 'gqu', d, k, 1, 0 ) );
  fprintf ( 1, '  Compressed    %4d\n', nwspgr_size ( 'gqu', d, k, 1, 1 ) );

  d = 2;
  k = 3;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Gauss Hermite, (-oo,+oo), [0,1], Dim %d, Level %d Symmetric\n', d, k );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full          %4d\n', nwspgr_size ( 'gqn', d, k, 1, 0 ) );
  fprintf ( 1, '  Compressed    %4d\n', nwspgr_size ( 'gqn', d, k, 1, 1 ) );

  d = 2;
  k = 3;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Clenshaw Curtis, [-1,+1], [0,1], Dim %d, Level %d Unsymmetric\n', d, k );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full        %4d\n', nwspgr_size ( 'cce', d, k, 0, 0 ) );
  fprintf ( 1, '  Compressed  %4d\n', nwspgr_size ( 'cce', d, k, 0, 1 ) );
%
%  Do a table.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level table for Clenshaw Curtis Exponential (CCE) Compressed\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:  ' )
  for d = 1 : 10
    fprintf ( 1, '  %6d', d );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  for k = 1 : 6
    fprintf ( 1, '  %2d:  ', k );
    for d = 1 : 10
      fprintf ( 1, '  %6d', nwspgr_size ( 'cce', d, k, 0, 1 ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Do a table.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level table for Clenshaw Curtis Exponential (CCE) Uncompressed\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:  ' )
  for d = 1 : 10
    fprintf ( 1, '  %6d', d );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  for k = 1 : 6
    fprintf ( 1, '  %2d:  ', k );
    for d = 1 : 10
      fprintf ( 1, '  %6d', nwspgr_size ( 'cce', d, k, 0, 0 ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Do a GLL table.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level table for Gauss-Legendre Linear (GLL) Compressed\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:  ' )
  for d = 1 : 6
    fprintf ( 1, '  %6d', d );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  for k = 1 : 11
    fprintf ( 1, '  %2d:  ', k );
    for d = 1 : 6
      fprintf ( 1, '  %6d', nwspgr_size ( 'gqu2', d, k, 0, 1 ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Do a GLO table.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level table for Gauss-Legendre-Odd (GLO) Compressed\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:  ' )
  for d = 1 : 6
    fprintf ( 1, '  %6d', d );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  for k = 1 : 11
    fprintf ( 1, '  %2d:  ', k );
    for d = 1 : 6
      fprintf ( 1, '  %6d', nwspgr_size ( 'glo', d, k, 0, 1 ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
