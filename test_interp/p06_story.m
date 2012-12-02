function p06_story ( )

%*****************************************************************************80
%
%% P06_STORY prints the "story" for problem p06.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carl DeBoor, John Rice,
%    Least-squares cubic spline approximation II - variable knots.
%    Technical Report CSD TR 21,
%    Purdue University, Lafayette, Indiana, 1968.
%
%    Carl DeBoor,
%    A Practical Guide to Splines,
%    Springer, 2001,
%    ISBN: 0387953663,
%    LC: QA1.A647.v27.
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data is due to deBoor and Rice.\n' );
  fprintf ( 1, '  The data represents a temperature dependent property of titanium.\n' );
  fprintf ( 1, '  The data has been used extensively as an example in spline\n' );
  fprintf ( 1, '  approximation with variably-spaced knots.\n' );
  fprintf ( 1, '  DeBoor considers two sets of knots:\n' );
  fprintf ( 1, '  (595,675,755,835,915,995,1075)\n' );
  fprintf ( 1, '  and\n' );
  fprintf ( 1, '  (595,725,850,910,975,1040,1075).\n' );

  return
end
