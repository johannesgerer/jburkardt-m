function blas1_d_test05 ( )

%*****************************************************************************80
%
%% TEST05 demonstrates DMACH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  DMACH returns some approximate machine numbers.\n' );
  fprintf ( 1, '\n' );
  job = 1;
  fprintf ( 1, '  DMACH(1) = EPS =  %e\n', dmach ( job ) );
  job = 2;
  fprintf ( 1, '  DMACH(2) = TINY = %e\n', dmach ( job ) );
  job = 3;
  fprintf ( 1, '  DMACH(3) = HUGE = %e\n', dmach ( job ) );

  return
end
