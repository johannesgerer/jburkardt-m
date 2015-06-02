# include <fintrf.h>

      subroutine mexFunction ( nlhs, plhs, nrhs, prhs )

c*********************************************************************72
c
cc MEXFUNCTION is a MATLAB/F77 interface for the Chebyshev U polynomial.
c
c  Discussion:
c
c    This file should be called "cheby_u.F".  It should be placed in the
c    MATLAB user's path.  It can be compiled externally, with a
c    command like
c
c      mex cheby_u.F
c
c    creating a compiled MEX file, or inside of MATLAB, the command
c
c      mex cheby_u.F
c
c    accomplishes the same task.  Once the file has been compiled,
c    the MATLAB user can invoke the function by typing:
c
c      cx = cheby_u ( n, x )
c
c    This routine computes the N+1 values of the Chebyshev U polynomials
c    of order 0 through N at the point X, returning the values in CX(1)
c    through CX(N+1).
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    30 September 2013
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Duane Hanselman, Bruce Littlefield,
c    Mastering MATLAB 7,
c    Pearson Prentice Hall, 2005,
c    ISBN: 0-13-143018-1.
c
c    The Mathworks,
c    MATLAB External Interfaces,
c    The Mathworks, 2000.
c
c  Parameters:
c
c    Input, integer NLHS, the number of output arguments.
c
c    Input, mwpointer PLHS(NLHS), pointers to the output arguments.
c
c    Input, integer NRHS, the number of input arguments.
c
c    Input, mwpointer PRHS(NRHS), pointers to the input arguments.
c
      implicit none

      integer nlhs
      integer nrhs

      double precision cx(1001)
      mwpointer cx_pointer
      mwpointer mxCreateDoubleMatrix
      mwpointer mxGetPr
      double precision mxGetScalar
      integer n
      mwpointer plhs(nlhs)
      mwpointer prhs(nrhs)
      double precision x
c
c  GET INPUT:
c    From the command line
c      cx = cheby_u ( n, x )
c    retrieve the first scalar integer input argument N,
c    and the second scalar real input argument X.
c
      n = mxGetScalar ( prhs(1) )
      x = mxGetScalar ( prhs(2) )

      if ( 1000 < n ) then
        call mexErrMsgTxt ( 'N must be <= 1000.' )
      end if
c
c  MAKE ROOM FOR OUTPUT:
c    Make space for the output argument,
c    and copy the pointer to that space.
c
      plhs(1) = mxCreateDoubleMatrix ( n+1, 1, 0 )
      cx_pointer = mxGetPr ( plhs(1) )
c
c  COMPUTATION:
c    Call the FORTRAN77 routine with the input and output arguments.
c
      call cheby_u ( n, x, cx )
c
c  Copy the output to where MATLAB expects it to be.
c
      call mxCopyReal8ToPtr ( cx, cx_pointer, n+1 )

      return
      end
      subroutine cheby_u ( n, x, cx )

c*********************************************************************72
c
cc CHEBY_U evaluates the Chebyshev polynomials of the second kind.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    01 October 2002
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    US Department of Commerce, 1964.
c
c  Parameters:
c
c    Input, integer N, the highest polynomial to compute.
c
c    Input, double precision X, the point at which the polynomials
c    are to be computed.
c
c    Output, double precision CX(N+1), the values of the N+1 Chebyshev
c    polynomials.
c
      implicit none

      integer n

      double precision cx(n+1)
      integer i
      double precision x

      if ( n .lt. 0 ) then
        return
      end if

      cx(1) = 1.0D+00

      if ( n .lt. 1 ) then
        return
      end if

      cx(2) = 2.0D+00 * x

      do i = 2, n
        cx(i+1) = 2.0D+00 * x * cx(i) - cx(i-1)
      end do

      return
      end
