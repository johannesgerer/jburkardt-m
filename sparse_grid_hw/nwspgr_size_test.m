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
%    30 November 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NWSPGR_SIZE_TEST:\n' );
  fprintf ( 1, '  NWSPGR_SIZE returns the size of a sparse grid, based on either:\n' );
  fprintf ( 1, '  one of the built-in 1D rules, or a family of 1D rules\n' );
  fprintf ( 1, '  supplied by the user.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Kronrod-Patterson, [0,1], Dim 2, Level 3, Symmetric\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full          %4d\n', nwspgr_size ( 'kpu', 2, 3, 1, 0 ) );
  fprintf ( 1, '  Compressed    %4d\n', nwspgr_size ( 'kpu', 2, 3, 1, 1 ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Kronrod-Patterson, (-oo,+oo), Dim 2, Level 3, Symmetric\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full          %4d\n', nwspgr_size ( 'kpn', 2, 3, 1, 0 ) );
  fprintf ( 1, '  Compressed    %4d\n', nwspgr_size ( 'kpn', 2, 3, 1, 1 ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Gauss-Legendre, [0,1], Dim 2, Level 3, Symmetric\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full          %4d\n', nwspgr_size ( 'gqu', 2, 3, 1, 0 ) );
  fprintf ( 1, '  Compressed    %4d\n', nwspgr_size ( 'gqu', 2, 3, 1, 1 ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Gauss Hermite, (-oo,+oo), [0,1], Dim 2, Level 3, Symmetric\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full          %4d\n', nwspgr_size ( 'gqn', 2, 3, 1, 0 ) );
  fprintf ( 1, '  Compressed    %4d\n', nwspgr_size ( 'gqn', 2, 3, 1, 1 ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Clenshaw Curtis, [-1,+1], [0,1], Dim 2, Level 3, Unsymmetric\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full        %4d\n', nwspgr_size ( 'ccu', 2, 3, 0, 0 ) );
  fprintf ( 1, '  Compressed  %4d\n', nwspgr_size ( 'ccu', 2, 3, 0, 1 ) );
%
%  Do a table.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level table for Clenshaw Curtis Compressed\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:  ' )
  for d = 1 : 10
    fprintf ( 1, '  %4d', d );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  for k = 1 : 5
    fprintf ( 1, '  %2d:  ', k );
    for d = 1 : 10
      fprintf ( 1, '  %6d', nwspgr_size ( 'ccu', d, k, 0, 1 ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Do a table.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level table for Clenshaw Curtis Uncompressed\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:  ' )
  for d = 1 : 10
    fprintf ( 1, '  %4d', d );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  for k = 1 : 5
    fprintf ( 1, '  %2d:  ', k );
    for d = 1 : 10
      fprintf ( 1, '  %6d', nwspgr_size ( 'ccu', d, k, 0, 0 ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
