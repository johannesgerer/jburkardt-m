function ns3de_test ( )

%*****************************************************************************80
%
%% NS3DE_TEST tests the NS3DE library.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_3d_exact/ns3de_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NS3DE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NS3DE library.\n' );

  ns3de_test01 ( );
  ns3de_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NS3DE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  timestamp ( )

  return
end
