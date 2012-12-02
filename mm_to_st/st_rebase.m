function indx = st_rebase ( base1, base2, nnzero, indx )

%*****************************************************************************80
%
%% ST_REBASE changes the base of an index array.
%
%  Discussion:
%
%    Both the ROW and COL arrays are ordinarily 0-based in the ST format.
%    FORTRAN and MATLAB expect 1-based indices.
%
%    To convert ROW and COL from 0-based to 1-based form, call this routine
%    with BASE1=0, BASE2=1.
%
%    If ROW and COL from FORTRAN or MATLAB are to be converted to ST format,
%    call this routine with BASE1=1 and BASE2=0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer BASE1, BASE2, the old and new bases.
%
%    Input, integer NNZERO, the number of nonzeros in the matrix.
%
%    Input, integer INDX(NNZERO), the index vector to be rebased.
%
%    Output, integer INDX(NNZERO), the index vector
%    to be rebased.
%
  indx(1:nnzero) = indx(1:nnzero) - base1 + base2;

  return
end
