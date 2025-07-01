/***********************************************************************************

	Procedure Name:		dbo.spTest
	Author:				Enterprise Database Development Team
	______________________________________________________________________________

	Purpose:			
	  TODO: Add text to describe the purpose of the procedure

	Parameters:
	  @Param1 (varchar 128)
		Description goes here

	  @Param2 (varchar 128)
		Description goes here

	Returns:
	  TODO: Add help text to describe any return values and/or result sets

	Remarks:
	  TODO: Add help text to provide more detailed usage instructions

	Example:
	  TODO: Add examples of calling and using the stored procedure
	______________________________________________________________________________

***********************************************************************************/
CREATE PROCEDURE dbo.spTest (
	 @Param1		VARCHAR(128)	= 'DefuaultValue'
	,@Param2		VARCHAR(128)	= 'DefuaultValue'
)
AS
BEGIN
	SET XACT_ABORT ON
	SET NOCOUNT ON

	--------------------------------------------------------------------------------
	-- Variable Declaration
	--------------------------------------------------------------------------------
		DECLARE
			 @ErrPos			VARCHAR(512)	= ''
			,@ErrMsg			VARCHAR(2048)	= ''
			,@MsgTitle			VARCHAR(256)	= concat('Execute ', object_schema_name(@@procid), '.', object_name(@@procid))
	
			-- Parameter Override 
			SELECT @Param1 = coalesce(@Param1, 'DefaultValue')

	--------------------------------------------------------------------------------
	-- BEGIN TRY... CATCH
	--------------------------------------------------------------------------------
		BEGIN TRY
			PRINT concat(sysdatetime(),' | INFO | ',@MsgTitle, '; *** Started ***')

			------------------------------------------------------------------------
			-- Set runtime values
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Set runtime values')
				PRINT concat(sysdatetime(),' | INFO | ',@ErrPos)
				
				  -- {Parameter}
				  PRINT concat(sysdatetime(),' | INFO | ',@ErrPos,'; {Parameter}')
				  
				  /* 
				    Add code to get/set table driven parameters. Remove this 
				    section if there are no parameters using the getter
				    setter pattern
				  */

			------------------------------------------------------------------------
			-- Validate Parameters
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Validate parameters')
				PRINT concat(sysdatetime(),' | INFO | ',@ErrPos)

				  -- {Parameter}
				  PRINT concat(sysdatetime(),' | INFO | ',@ErrPos,'; {Parameter}')
			  	
				  /* 
					Add code to validate specified and stored parameter
					values. Remove this section if there are no parameters
					to validate.
				  */

			------------------------------------------------------------------------
			-- Initialize procedure resources
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Initialize procedure resources')
				PRINT concat(sysdatetime(),' | INFO | ',@ErrPos)

				  -- {Resource Name}
				  PRINT concat(sysdatetime(),' | INFO | ',@ErrPos,'; {Resource Name}')
			  
				  /*
					Add code to drop/create procedure objects such as temp 
					tables, staging tables, lists etc. Remove this section if 
					there are no objects to initialize.
				  */

			------------------------------------------------------------------------
			-- {Procedure Main} Example: "Save HrPlus Employee data"
			------------------------------------------------------------------------
				SET @ErrPos = concat(@MsgTitle, '; Do the work')
				PRINT concat(sysdatetime(),' | INFO | ',@ErrPos)
			
				/* 
				  Add the procedure's main code here. Remember the intention of 
				  this template is to separate code that validates input and 
				  prepares objects from the code that reads and/or writes 
				  persisted or temporary data.
				*/
		END TRY
		BEGIN CATCH
			-- Errors here are fatal; format and throw exception to caller
			SET @ErrMsg = concat('Failed to ',@ErrPos,'  { ',error_number(),' } ',error_message())
			PRINT concat(sysdatetime(),' | *ERR | ',@ErrMsg);
			THROW 2147483647,@ErrMsg,1;
		END CATCH	
		
		PRINT concat(sysdatetime(),' | INFO | ',@MsgTitle, '; *** Completed ***')
END