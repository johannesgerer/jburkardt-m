function [ n, nelt, isym, irhs, isoln, ia, ja, a, rhs, soln ] = ...
  dlap_file_read ( n_max, nelt_max, iunit )

%*****************************************************************************80
%
%% DLAP_FILE_READ reads in a DLAP matrix contained in a file.
%
%  Discussion:
%
%    This routine reads in a DLAP Triad Format Linear System,
%    including the matrix, right hand side, and solution, if known.
%
%    The original version of this program seems to have a minor
%    logical flaw.  If the user requests the solution but not
%    the right hand side, and the file contains both, the original
%    program would not correctly read past the right hand side
%    to get to the solution.  The current version should fix
%    that flaw.
%
%    The expected format of the file is as follows.  On the first line
%    are counters and flags: N, NELT, ISYM, IRHS, ISOLN.  N, NELT
%    and ISYM are described below.  IRHS is a flag indicating if
%    the RHS was written out (1 is yes, 0 is  no).  ISOLN is a
%    flag indicating if the SOLN was written out  (1 is yes, 0 is
%    no).  The format for the first line is: 5i10.  Then comes the
%    NELT Triad's IA(I), JA(I) and A(I), I = 1, NELT.  The format
%    for these lines is   :  1X,I5,1X,I5,1X,E16.7.   Then comes
%    RHS(I), I = 1, N, if IRHS = 1.  Then comes SOLN(I), I  = 1,
%    N, if ISOLN = 1.  The format for these lines is: 1X,E16.7.
%
%
%    This routine requires that the  matrix A be stored in the
%    DLAP Triad format.  In this format only the non-zeros  are
%    stored.  They may appear in ANY order.  The user supplies
%    three arrays of length NELT, where NELT is the number of
%    non-zeros in the matrix: (IA(NELT), JA(NELT), A(NELT)).  For
%    each non-zero the user puts the row and column index of that
%    matrix element in the IA and JA arrays.  The value of the
%    non-zero matrix element is placed in the corresponding
%    location of the A array.   This is an extremely easy data
%    structure to generate.  On the other hand it is not too
%    efficient on vector computers for the iterative solution of
%    linear systems.  Hence,  DLAP changes this input data
%    structure to the DLAP Column format for the iteration (but
%    does not change it back).
%
%    Here is an example of the DLAP Triad storage format for a
%    5x5 Matrix.  Recall that the entries may appear in any order.
%
%        5x5 Matrix       DLAP Triad format for 5x5 matrix on left.
%                              1  2  3  4  5  6  7  8  9 10 11
%    |11 12  0  0 15|   A: 51 12 11 33 15 53 55 22 35 44 21
%    |21 22  0  0  0|  IA:  5  1  1  3  1  5  5  2  3  4  2
%    | 0  0 33  0 35|  JA:  1  2  1  3  5  3  5  2  5  4  1
%    | 0  0  0 44  0|
%    |51  0 53  0 55|
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Mark Seager,
%    A SLAP for the Masses,
%    Lawrence Livermore National Laboratory,
%    Technical Report UCRL-100267, December 1988.
%
%  Parameters:
%
%    Input, integer N_MAX, the maximum value of N for which storage
%    has been allocated.
%
%    Input, integer NELT_MAX, the maximum value of NELT for which
%    storage has been allocated.
%
%    Input, integer IUNIT, the I/O device to be read.
%
%    Output, integer N, the order of the matrix.
%
%    Output, integer NELT, the number of non-zeros stored in A.
%
%    Output, integer ISYM, a flag to indicate symmetric storage 
%    format.
%    * 0, all nonzero entries of the matrix are stored.
%    * 1, the matrix is symmetric, and only the lower triangle of the
%    matrix is stored.
%
%    Output, integer IRHS, is 1 if a right hand side vector is 
%    included.
%
%    Output, integer ISOLN, is 1 if a solution vector is included.
%
%    Output, integer IA(NELT), integer JA(NELT),
%    real A(NELT).  On output these arrays hold the matrix A in the
%    DLAP Triad format.
%
%    Output, real RHS(N), the right hand side vector.
%
%    Output, real SOLN(N), the solution to the linear system, 
%    if present.
%

%
%  Read the header line.
%
  [ n, nelt, isym, irhs, isoln, ios ] = dlap_header_read ( iunit );

  if ( ios ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DLAP_FILE_READ - Fatal error!\n' );
    fprintf ( 1, '  Error while reading header line of DLAP file.\n' );
    error ( 'DLAP_FILE_READ - Fatal error!' );
  end

  if ( nelt_max < nelt )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DLAP_FILE_READ - Fatal error!\n' );
    fprintf ( 1, '  NELT_MAX < NELT.\n' );
    fprintf ( 1, '  NELT_MAX = %d\n', nelt_max );
    fprintf ( 1, '  NELT     = %d\n', nelt );
    error ( 'DLAP_FILE_READ - Fatal error!' );
  end
%
%  Read the nonzero matrix entries in DLAP Triad format.
%
  ia = zeros ( nelt, 1 );
  ja = zeros ( nelt, 1 );
  a = zeros ( nelt, 1 );

  for i = 1 : nelt

    line = fgets ( iunit )

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DLAP_FILE_READ - Fatal error!\n' );
      fprintf ( 1, '  Error while reading matrix element %d\n', i );
      error ( 'DLAP_FILE_READ - Fatal error!' );
    end

    [ x, count ] = sscanf ( line, '%d%d%f' )

    if ( count ~= 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DLAP_FILE_READ - Fatal error!\n' );
      fprintf ( 1, '  Error while reading matrix element %d\n', i );
      error ( 'DLAP_FILE_READ - Fatal error!' );
    end

    ia(i) = x(1);
    ja(i) = x(2);
    a(i) = x(3);

  end
%
%  If a value for RHS is available in the file, read it in.
%
  if ( irhs == 1 )

    if ( n_max < n )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DLAP_FILE_READ - Fatal error!\n' );
      fprintf ( 1, '  N_MAX < N.\n' );
      fprintf ( 1, '  N_MAX = %d\n', n_max );
      fprintf ( 1, '  N     = %d\n', n );
      error ( 'DLAP_FILE_READ - Fatal error!' );
    end

    [ rhs, ios ] = dlap_rhs_read ( iunit, n );

    if ( ios ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DLAP_FILE_READ - Fatal error!\n' );
      fprintf ( 1, '  Error while reading RHS from DLAP file.\n' );
      error ( 'DLAP_FILE_READ - Fatal error!' );
    end

  else

    rhs = [];

  end
%
%  If a value of SOLN is available in the file, read it.
%
  if ( isoln == 1 )

    if ( n_max < n )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DLAP_FILE_READ - Fatal error!\n' );
      fprintf ( 1, '  N_MAX < N.\n' );
      fprintf ( 1, '  N_MAX = %d\n', n_max );
      fprintf ( 1, '  N     = %d\n', n );
      error ( 'DLAP_FILE_READ - Fatal error!' );
    end

    [ soln, ios ] = dlap_soln_read ( iunit, n );

    if ( ios ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DLAP_FILE_READ - Fatal error!\n' );
      fprintf ( 1, '  Error while reading SOLN from DLAP file.\n' );
      error ( 'DLAP_FILE_READ - Fatal error!' );
    end

  else

    soln = [];

  end

  return
end
