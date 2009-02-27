/*
##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCascade library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.
*/
%module Select2D

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}


%include Select2D_dependencies.i


%include Select2D_headers.i


enum Select2D_TypeOfSelection {
	Select2D_TOS_BOUNDARY,
	Select2D_TOS_INTERIOR,
	};



%nodefaultctor Handle_Select2D_Projector;
class Handle_Select2D_Projector : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_Select2D_Projector();
		%feature("autodoc", "1");
		Handle_Select2D_Projector();
		%feature("autodoc", "1");
		Handle_Select2D_Projector(const Handle_Select2D_Projector &aHandle);
		%feature("autodoc", "1");
		Handle_Select2D_Projector(const Select2D_Projector *anItem);
		%feature("autodoc", "1");
		Handle_Select2D_Projector const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select2D_Projector {
	Select2D_Projector* GetObject() {
	return (Select2D_Projector*)$self->Access();
	}
};

%nodefaultctor Handle_Select2D_SensitiveEntity;
class Handle_Select2D_SensitiveEntity : public Handle_SelectBasics_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		~Handle_Select2D_SensitiveEntity();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveEntity();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveEntity(const Handle_Select2D_SensitiveEntity &aHandle);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveEntity(const Select2D_SensitiveEntity *anItem);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveEntity const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select2D_SensitiveEntity {
	Select2D_SensitiveEntity* GetObject() {
	return (Select2D_SensitiveEntity*)$self->Access();
	}
};

%nodefaultctor Handle_Select2D_SensitivePoint;
class Handle_Select2D_SensitivePoint : public Handle_Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		~Handle_Select2D_SensitivePoint();
		%feature("autodoc", "1");
		Handle_Select2D_SensitivePoint();
		%feature("autodoc", "1");
		Handle_Select2D_SensitivePoint(const Handle_Select2D_SensitivePoint &aHandle);
		%feature("autodoc", "1");
		Handle_Select2D_SensitivePoint(const Select2D_SensitivePoint *anItem);
		%feature("autodoc", "1");
		Handle_Select2D_SensitivePoint const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select2D_SensitivePoint {
	Select2D_SensitivePoint* GetObject() {
	return (Select2D_SensitivePoint*)$self->Access();
	}
};

%nodefaultctor Handle_Select2D_SensitiveArc;
class Handle_Select2D_SensitiveArc : public Handle_Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		~Handle_Select2D_SensitiveArc();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveArc();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveArc(const Handle_Select2D_SensitiveArc &aHandle);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveArc(const Select2D_SensitiveArc *anItem);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveArc const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select2D_SensitiveArc {
	Select2D_SensitiveArc* GetObject() {
	return (Select2D_SensitiveArc*)$self->Access();
	}
};

%nodefaultctor Handle_Select2D_SensitiveSegment;
class Handle_Select2D_SensitiveSegment : public Handle_Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		~Handle_Select2D_SensitiveSegment();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveSegment();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveSegment(const Handle_Select2D_SensitiveSegment &aHandle);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveSegment(const Select2D_SensitiveSegment *anItem);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveSegment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select2D_SensitiveSegment {
	Select2D_SensitiveSegment* GetObject() {
	return (Select2D_SensitiveSegment*)$self->Access();
	}
};

%nodefaultctor Handle_Select2D_SensitiveCircle;
class Handle_Select2D_SensitiveCircle : public Handle_Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		~Handle_Select2D_SensitiveCircle();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveCircle();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveCircle(const Handle_Select2D_SensitiveCircle &aHandle);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveCircle(const Select2D_SensitiveCircle *anItem);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveCircle const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select2D_SensitiveCircle {
	Select2D_SensitiveCircle* GetObject() {
	return (Select2D_SensitiveCircle*)$self->Access();
	}
};

%nodefaultctor Handle_Select2D_SensitiveBox;
class Handle_Select2D_SensitiveBox : public Handle_Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		~Handle_Select2D_SensitiveBox();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveBox();
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveBox(const Handle_Select2D_SensitiveBox &aHandle);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveBox(const Select2D_SensitiveBox *anItem);
		%feature("autodoc", "1");
		Handle_Select2D_SensitiveBox const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select2D_SensitiveBox {
	Select2D_SensitiveBox* GetObject() {
	return (Select2D_SensitiveBox*)$self->Access();
	}
};

%nodefaultctor Select2D_SensitiveEntity;
class Select2D_SensitiveEntity : public SelectBasics_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		virtual		Standard_Boolean NeedsConversion() const;
		%feature("autodoc", "1");
		virtual		void Convert(const Handle_Select2D_Projector &aProjector);
		%feature("autodoc", "1");
		virtual		Standard_Integer MaxBoxes() const;
		%feature("autodoc", "1");
		void SetOwnTolerance(const Standard_Real aVal);
		%feature("autodoc", "1");
		void UnsetOwnTolerance();
		%feature("autodoc", "1");
		Standard_Boolean HasOwnTolerance() const;
		%feature("autodoc", "1");
		Standard_Real OwnTolerance() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Is3D() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const TColgp_Array1OfPnt2d &Polyline, const Bnd_Box2d &aBox, const Standard_Real aTol);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Select2D_SensitiveEntity {
	Handle_Select2D_SensitiveEntity GetHandle() {
	return *(Handle_Select2D_SensitiveEntity*) &$self;
	}
};

%nodefaultctor Select2D_SensitiveCircle;
class Select2D_SensitiveCircle : public Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		Select2D_SensitiveCircle(const Handle_SelectBasics_EntityOwner &OwnerId, const gp_Circ2d &TheCirc, const Select2D_TypeOfSelection TheType=Select2D_TOS_BOUNDARY);
		%feature("autodoc", "1");
		virtual		void Areas(SelectBasics_ListOfBox2d & aresul);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real XMin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Standard_Real aTol);
		%feature("autodoc", "1");
		const gp_Circ2d & Circle() const;
		%feature("autodoc", "1");
		void SetTypeOfSelection(const Select2D_TypeOfSelection theType);
		%feature("autodoc", "1");
		Select2D_TypeOfSelection Selection();
		%feature("autodoc", "1");
		virtual		~Select2D_SensitiveCircle();

};
%extend Select2D_SensitiveCircle {
	Handle_Select2D_SensitiveCircle GetHandle() {
	return *(Handle_Select2D_SensitiveCircle*) &$self;
	}
};

%nodefaultctor Select2D_SensitiveSegment;
class Select2D_SensitiveSegment : public Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		Select2D_SensitiveSegment(const Handle_SelectBasics_EntityOwner &OwnerId, const gp_Pnt2d &FirstP, const gp_Pnt2d &LastP, const Standard_Integer MaxRect=3);
		%feature("autodoc", "1");
		void Set(const Standard_Integer nbrect);
		%feature("autodoc", "1");
		void StartPoint(const gp_Pnt2d &aPt);
		%feature("autodoc", "1");
		void EndPoint(const gp_Pnt2d &aPt);
		%feature("autodoc", "1");
		const gp_Pnt2d & StartPoint() const;
		%feature("autodoc", "1");
		const gp_Pnt2d & EndPoint() const;
		%feature("autodoc", "1");
		virtual		void Areas(SelectBasics_ListOfBox2d & aSeq);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real XMin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Standard_Real aTol);
		%feature("autodoc", "1");
		virtual		Standard_Integer MaxBoxes() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Select2D_SensitiveSegment();

};
%extend Select2D_SensitiveSegment {
	Handle_Select2D_SensitiveSegment GetHandle() {
	return *(Handle_Select2D_SensitiveSegment*) &$self;
	}
};

%nodefaultctor Select2D_SensitivePoint;
class Select2D_SensitivePoint : public Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		Select2D_SensitivePoint(const Handle_SelectBasics_EntityOwner &OwnerId, const gp_Pnt2d &Location, const Standard_Real InitSensitivity=0);
		%feature("autodoc", "1");
		void Set(const Standard_Real aSensitivity);
		%feature("autodoc", "1");
		virtual		void Areas(SelectBasics_ListOfBox2d & aresul);
		%feature("autodoc", "1");
		const gp_Pnt2d & Location() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real XMin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Standard_Real aTol);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Select2D_SensitivePoint();

};
%extend Select2D_SensitivePoint {
	Handle_Select2D_SensitivePoint GetHandle() {
	return *(Handle_Select2D_SensitivePoint*) &$self;
	}
};

%nodefaultctor Select2D_SensitiveArc;
class Select2D_SensitiveArc : public Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		Select2D_SensitiveArc(const Handle_SelectBasics_EntityOwner &OwnerId, const gp_Ax2d &OriginAxis, const Standard_Real Angle, const Standard_Real Radius, const Standard_Integer MaxPoints=9);
		%feature("autodoc", "1");
		virtual		void Areas(SelectBasics_ListOfBox2d & aresul);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real XMin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Standard_Real aTol);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Select2D_SensitiveArc();

};
%extend Select2D_SensitiveArc {
	Handle_Select2D_SensitiveArc GetHandle() {
	return *(Handle_Select2D_SensitiveArc*) &$self;
	}
};

%nodefaultctor Select2D_SensitiveBox;
class Select2D_SensitiveBox : public Select2D_SensitiveEntity {
	public:
		%feature("autodoc", "1");
		Select2D_SensitiveBox(const Handle_SelectBasics_EntityOwner &OwnerId, const gp_Pnt2d &Center, const Standard_Real Height, const Standard_Real Width, const Select2D_TypeOfSelection Type=Select2D_TOS_INTERIOR);
		%feature("autodoc", "1");
		Select2D_SensitiveBox(const Handle_SelectBasics_EntityOwner &OwnerId, const Standard_Real Xmin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Select2D_TypeOfSelection Type=Select2D_TOS_INTERIOR);
		%feature("autodoc", "1");
		virtual		void Areas(SelectBasics_ListOfBox2d & aresul);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Matches(const Standard_Real XMin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Standard_Real aTol);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Select2D_SensitiveBox();

};
%extend Select2D_SensitiveBox {
	Handle_Select2D_SensitiveBox GetHandle() {
	return *(Handle_Select2D_SensitiveBox*) &$self;
	}
};

%nodefaultctor Select2D_Projector;
class Select2D_Projector : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		void Convert(const gp_Pnt2d &aPointIn, gp_Pnt2d & aPointOut) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Select2D_Projector {
	Handle_Select2D_Projector GetHandle() {
	return *(Handle_Select2D_Projector*) &$self;
	}
};