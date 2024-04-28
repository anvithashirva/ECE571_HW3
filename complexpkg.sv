package complexpkg;

typedef struct {
shortreal Real;
shortreal Imaginary;
} complex;

function complex AddComplex(input complex M, N);
	AddComplex.Real = (M.Real+N.Real);
	AddComplex.Imaginary = (M.Imaginary+N.Imaginary);
endfunction

function complex MultComplex(input complex M, N);
	MultComplex.Real = ((M.Real * N.Real) - (M.Imaginary * N.Imaginary)) ;
	MultComplex.Imaginary = (M.Real * N.Imaginary) + (M.Imaginary * N.Real) ;
endfunction

function complex CreateComplex(input shortreal RealPart, ImaginaryPart);
	CreateComplex.Real = RealPart;
	CreateComplex.Imaginary = ImaginaryPart;
endfunction

function void PrintComplex(input complex C);
	$display("r: %g, i: %g",C.Real,C.Imaginary);
endfunction

function void ComplexToComponents(input complex C, output shortreal RealPart, ImaginaryPart);
	RealPart = C.Real;
	ImaginaryPart = C.Imaginary;
endfunction
	
endpackage