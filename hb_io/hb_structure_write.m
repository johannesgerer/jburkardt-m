function hb_structure_write ( output_unit, ncol, mxtype, nnzero, neltvl, ...
  ptrfmt, indfmt, colptr, rowind )

%*****************************************************************************80
%
%% HB_STRUCTURE_WRITE writes the structure of an HB file.
%
%  Discussion:
%
%    The user should already have opened the file, and written 
%    the header records.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2004
%
%  Author:
%
%    John Burkardt
%    Xiaoye Li, UC Berkeley. 
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, file pointer OUTPUT_UNIT, the unit to which data is written.
%
%    Input, integer NCOL, the number of columns or elements.
%
%    Input, string MXTYPE, the matrix type, up to 3 characters
%    First character is R for Real, C for complex, P for pattern only.
%    Second character is S for symmetric, U for unsymmetric, H for
%      Hermitian, Z for skew symmetric, R for rectangular.
%    Third character is A for assembled and E for unassembled
%      finite element matrices.
%
%    Input, integer NNZERO.  In the case of assembled sparse matrices,
%    this is the number of nonzeroes.  In the case of unassembled finite
%    element matrices, in which the right hand side vectors are also
%    stored as unassembled finite element vectors, this is the total
%    number of entries in a single unassembled right hand side vector.
%
%    Input, integer NELTVL, the number of finite element matrix entries,
%    set to 0 in the case of assembled matrices.
%
%    Input, string PTRFMT, the format for writing pointers,
%    up to 16 characters.
%
%    Input, string INDFMT, the format for writing row indices,
%    up to 16 characters.
%
%    Input, integer COLPTR(NCOL+1), COLPTR(I) points to the location of
%    the first entry of column I in the sparse matrix structure.
%
%    Input, integer ROWIND(NNZERO) or ROWIND(NELTVL), the row index of
%    each item.
%

%
%  From the FORTRAN format string PTRFMT, determine the number of
%  integers per line, and their width.
%
  line = ptrfmt(2:length(ptrfmt));
  [ ptr_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
  line = line(nextindex+1:length(line));
  [ ptr_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
%
%  Column pointers.
%
%  ptrfmt has the form '(nIw)'
%  where n is ptr_nperline
%  and w is ptr_len.
%
  s = int2str ( ptr_len );
  ptr_format = [ '%' s 'd' ];

  for j = 1 : ncol + 1
    fprintf ( output_unit, ptr_format, colptr(j) );
    if ( mod ( j, ptr_nperline ) == 0 ) 
      fprintf ( output_unit, '\n' );
    end
  end

  if ( mod ( ncol + 1, ptr_nperline ) ~= 0 )
    fprintf ( output_unit, '\n' );
  end
%
%  From the FORTRAN format string INDFMT, determine the number of
%  integers per line, and their width.
%
  line = indfmt(2:length(indfmt));
  [ ind_nperline, count, errmsg, nextindex ] = sscanf ( line, '%d' );
  line = line(nextindex+1:length(line));
  [ ind_len, count, errmsg, nextindex ] = sscanf ( line, '%d' );
%
%  Row indices.
%
  s = int2str ( ind_len );
  ind_format = [ '%' s 'd' ];

  if ( mxtype(3) == 'A' )

    for j = 1 : nnzero
      fprintf ( output_unit, ind_format, rowind(j) );
      if ( mod ( j, ind_nperline ) == 0 ) 
        fprintf ( output_unit, '\n' );
      end
    end

  elseif ( mxtype(3) == 'E' )
      
    number = colptr(ncol) - colptr(1);
    
    for j = 1 : number
      fprintf ( output_unit, ind_format, rowind(j) );
      if ( mod ( j, ind_nperline ) == 0 ) 
        fprintf ( output_unit, '\n' );
      end
    end

  end
  
  return
end
