DZDataDrivenSenTestCase
=======================
Simple data driven testing for OCUnit test cases.

DZDataDrivenSenTestCase will run your test, providing an input value and expected output value. Instead of writing hundreds of tests, you provide a method of feeding your test values and you write one test - the class does all the work. 
By default it uses a PList as a source of data, but you are free to implement your own data sources for your own needs. For example, you could implement a simple data source that provides random strings of various lengths as input to test an object's input validation.

Since DZDataDrivenSenTestCase is a testing tool, it is packaged as part of a project with a test. The project under test is a simple library containing an NSValueTransformer that doubles whatever numeric input it receives. This should give anyone a simple starting point and guide to using the testing class.

Simple Usage
------------
Subclass `DZDataDrivenSenTestCase` instead of `SenTestCase` in your test. In `- (void) setUp` set your unit under test object, and dispose of it in `- (void) tearDown` . See the section below on providing data for your tests.


Providing data for tests
------------------------
`DZTestCaseDataSource` provides an interface for providing test data. 
A simple data source, `DZTestCaseDictionaryDataSource`, is provided and used by default. `DZTestCaseDictionaryDataSource` will look for a PList in your test bundle with the same name as your test case, and load the root dictionary from that.

You can create a new object implementing `DZTestCaseDataSource` which provides key-value pairs from a random source, web service, database, file, etc. To use it in your test case, simply override `+ (id<DZTestCaseDataSource>)dataSource` and return your data source object.