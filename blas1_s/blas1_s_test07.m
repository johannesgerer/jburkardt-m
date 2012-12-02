function blas1_s_test07 ( )

%*****************************************************************************80
%
%% TEST07 demonstrates SMACH.
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
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  SMACH returns some approximate machine numbers.\n' );
  fprintf ( 1, '\n' );
  job = 1;
  fprintf ( 1, '  SMACH(1) = EPS =  %e\n', smach ( job ) );
  job = 2;
  fprintf ( 1, '  SMACH(2) = TINY = %e\n', smach ( job ) );
  job = 3;
  fprintf ( 1, '  SMACH(3) = HUGE = %e\n', smach ( job ) );

  return
end
