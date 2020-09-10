## Phases of CI CD pipeline
1. The **Plan phase** often combines practices from Scrum and Agile to enable frequent microincremental releases.
2. The **Code phase** focuses on core development tasks from within IDEs and appropriate sandboxing and frameworks.
Tools: Git, VS Code, Eclipse, Jira
3. The **Build phase** rapidly and incrementally merges code commits with some testing and security validation.
Tools: Maven, Gradle, Ant
4. The **Test phase** focuses on automated verification of enhancements, often incorporating test-driven deployment practices. Testing is sometimes incorporated as part of the Build phase, and generally extends in some way to all phases of the CI/CD process to ensure continuous feedback and improvement.
Tools: Selenium, JUnit
5. The **Release phase** is centered around repository commits and adequate documentation of the changes.
Tools: Jenkins, Bamboo
6. The **Deploy phase** is the actual update to the codebase, with special thought given to issue and error avoidance.
Tools: Puppet, Chef, Ansible, Saltstack
7. The **Operate phase** occurs once the code is made live, and consists of monitoring and orchestration.
8. The **Monitor & Optimize phase** takes place parallel to the Operate phase and consists of data collection, analysis, and feedback to the start of the pipeline and to other phases as needed. In the most sophisticated environments, optimization is automated as continuous optimization (CO), an extension of CI/CD that leverages machine learning to eliminate risks and waste associated with manual infrastructure selection.
TOols:Splunk, Nagios, Sensu
