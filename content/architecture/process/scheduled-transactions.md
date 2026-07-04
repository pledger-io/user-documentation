---
title: Scheduled transactions
type: docs
draft: true
weight: 3
---
## Required variables

*Generic variables that are required for the scheduling process:*

* `subProcess` - the name of the sub-process that is triggered by the scheduled transaction.
For this process, the sub-process is `ScheduledTransaction`.
* `start` - the start date for the schedule.
* `end` - the end date for the schedule.
* `interval` - the interval between the scheduled transactions.
* `periodicity` - the frequency of the scheduled transactions.

*Specif variables needed for the scheduled transaction process:*

* `ScheduledTransaction` - a map with the settings for the sub-process.
** `id` - the unique identifier for the scheduled transaction.

## The business process

A scheduled transaction is a business process that is modeled as a scheduled event.
The event is triggered by a scheduled date and time.
The reoccurrence of the event is determined by the interval and periodicity of the scheduled transaction.

This process re-uses the generic process scheduler BPMN flow to trigger the start of the more specific scheduled transaction process.

.Generic scheduling diagram
[bpmn, generated/architecture/process/process-scheduler, svg]
....
```bpmn
<?xml version="1.0" encoding="UTF-8"?>
<bpmn:definitions xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" id="Definitions_1gaso3i" targetNamespace="http://bpmn.io/schema/bpmn" exporter="Camunda Modeler" exporterVersion="5.17.0">
    <bpmn:process id="ProcessScheduler" name="Process Scheduler" isExecutable="true" camunda:versionTag="1.0.0" camunda:historyTimeToLive="P1000D">
        <bpmn:documentation>For this scheduler flow the following variables must be set upon startup:

            - start, ISO start date
            - end, ISO end date
            - periodicity, from the enumerate in code
            - interval, integer value of amount of periodicity bewteeen schedule</bpmn:documentation>
        <bpmn:startEvent id="start" camunda:formKey="scheduleForm">
            <bpmn:extensionElements>
                <camunda:formData>
                    <camunda:formField id="range$start" type="string" />
                    <camunda:formField id="range$end" type="string" />
                    <camunda:formField id="subProcess" type="string" />
                    <camunda:formField id="periodicity" type="string" />
                </camunda:formData>
            </bpmn:extensionElements>
            <bpmn:outgoing>SequenceFlow_0nzbzo0</bpmn:outgoing>
        </bpmn:startEvent>
        <bpmn:sequenceFlow id="SequenceFlow_0nzbzo0" sourceRef="start" targetRef="determine_delay" />
        <bpmn:sequenceFlow id="SequenceFlow_1uhkn62" sourceRef="scheduled_wait" targetRef="call_sub_process" />
        <bpmn:callActivity id="call_sub_process" name="Start process" calledElement="${subProcess}" camunda:variableMappingClass="com.jongsoft.finance.bpmn.delegate.scheduler.SchedulerVariableMappingDelegate">
            <bpmn:extensionElements>
                <camunda:executionListener delegateExpression="${startProcessListener}" event="start" />
            </bpmn:extensionElements>
            <bpmn:incoming>SequenceFlow_1uhkn62</bpmn:incoming>
            <bpmn:outgoing>sf_reschedule</bpmn:outgoing>
        </bpmn:callActivity>
        <bpmn:exclusiveGateway id="should_reschedule" name="limit reached" default="sf_terminate">
            <bpmn:incoming>sf_should_continue</bpmn:incoming>
            <bpmn:outgoing>sf_continue</bpmn:outgoing>
            <bpmn:outgoing>sf_terminate</bpmn:outgoing>
        </bpmn:exclusiveGateway>
        <bpmn:sequenceFlow id="sf_reschedule" sourceRef="call_sub_process" targetRef="determine_delay" />
        <bpmn:endEvent id="EndEvent_0jfl3x8">
            <bpmn:incoming>sf_terminate</bpmn:incoming>
        </bpmn:endEvent>
        <bpmn:sequenceFlow id="sf_delay" sourceRef="determine_delay" targetRef="st_determine_expired" />
        <bpmn:serviceTask id="determine_delay" name="Determine delay" camunda:class="com.jongsoft.finance.bpmn.delegate.scheduler.DetermineDelayDelegate">
            <bpmn:incoming>SequenceFlow_0nzbzo0</bpmn:incoming>
            <bpmn:incoming>sf_reschedule</bpmn:incoming>
            <bpmn:outgoing>sf_delay</bpmn:outgoing>
        </bpmn:serviceTask>
        <bpmn:intermediateCatchEvent id="scheduled_wait" name="wait">
            <bpmn:incoming>sf_continue</bpmn:incoming>
            <bpmn:outgoing>SequenceFlow_1uhkn62</bpmn:outgoing>
            <bpmn:timerEventDefinition>
                <bpmn:timeDate xsi:type="bpmn:tFormalExpression">${nextRun}</bpmn:timeDate>
            </bpmn:timerEventDefinition>
        </bpmn:intermediateCatchEvent>
        <bpmn:serviceTask id="st_determine_expired" name="Determine expired" camunda:class="com.jongsoft.finance.bpmn.delegate.scheduler.ScheduleToContinueDelegate">
            <bpmn:incoming>sf_delay</bpmn:incoming>
            <bpmn:outgoing>sf_should_continue</bpmn:outgoing>
        </bpmn:serviceTask>
        <bpmn:sequenceFlow id="sf_should_continue" sourceRef="st_determine_expired" targetRef="should_reschedule" />
        <bpmn:sequenceFlow id="sf_continue" name="no&#10;&#10;" sourceRef="should_reschedule" targetRef="scheduled_wait">
            <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">${continue}</bpmn:conditionExpression>
        </bpmn:sequenceFlow>
        <bpmn:sequenceFlow id="sf_terminate" name="yes&#10;&#10;" sourceRef="should_reschedule" targetRef="EndEvent_0jfl3x8" />
    </bpmn:process>
    <bpmndi:BPMNDiagram id="BPMNDiagram_1">
        <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="ProcessScheduler">
            <bpmndi:BPMNShape id="_BPMNShape_StartEvent_2" bpmnElement="start">
                <dc:Bounds x="162" y="158" width="36" height="36" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="CallActivity_1ra326z_di" bpmnElement="call_sub_process">
                <dc:Bounds x="940" y="136" width="100" height="80" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="ExclusiveGateway_1i13v0l_di" bpmnElement="should_reschedule" isMarkerVisible="true">
                <dc:Bounds x="631" y="151" width="50" height="50" />
                <bpmndi:BPMNLabel>
                    <dc:Bounds x="628" y="206" width="63" height="14" />
                </bpmndi:BPMNLabel>
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="EndEvent_0jfl3x8_di" bpmnElement="EndEvent_0jfl3x8">
                <dc:Bounds x="1159" y="158" width="36" height="36" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="ServiceTask_0hv186u_di" bpmnElement="determine_delay">
                <dc:Bounds x="261" y="136" width="100" height="80" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="IntermediateCatchEvent_0tqk4z5_di" bpmnElement="scheduled_wait">
                <dc:Bounds x="796" y="158" width="36" height="36" />
                <bpmndi:BPMNLabel>
                    <dc:Bounds x="805" y="201" width="20" height="14" />
                </bpmndi:BPMNLabel>
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="ServiceTask_1y7qhev_di" bpmnElement="st_determine_expired">
                <dc:Bounds x="449" y="136" width="100" height="80" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNEdge id="SequenceFlow_0nzbzo0_di" bpmnElement="SequenceFlow_0nzbzo0">
                <di:waypoint x="198" y="176" />
                <di:waypoint x="261" y="176" />
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="SequenceFlow_1uhkn62_di" bpmnElement="SequenceFlow_1uhkn62">
                <di:waypoint x="832" y="176" />
                <di:waypoint x="940" y="176" />
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="SequenceFlow_0jt1cqb_di" bpmnElement="sf_reschedule">
                <di:waypoint x="990" y="216" />
                <di:waypoint x="990" y="292" />
                <di:waypoint x="311" y="292" />
                <di:waypoint x="311" y="216" />
                <bpmndi:BPMNLabel>
                    <dc:Bounds x="645" y="222" width="13" height="14" />
                </bpmndi:BPMNLabel>
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="SequenceFlow_1fkf95e_di" bpmnElement="sf_delay">
                <di:waypoint x="361" y="176" />
                <di:waypoint x="449" y="176" />
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="SequenceFlow_1ymtsgk_di" bpmnElement="sf_should_continue">
                <di:waypoint x="549" y="176" />
                <di:waypoint x="631" y="176" />
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="SequenceFlow_088tv3y_di" bpmnElement="sf_continue">
                <di:waypoint x="681" y="176" />
                <di:waypoint x="796" y="176" />
                <bpmndi:BPMNLabel>
                    <dc:Bounds x="732" y="158" width="13" height="40" />
                </bpmndi:BPMNLabel>
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="SequenceFlow_02gptux_di" bpmnElement="sf_terminate">
                <di:waypoint x="656" y="151" />
                <di:waypoint x="656" y="99" />
                <di:waypoint x="1177" y="99" />
                <di:waypoint x="1177" y="158" />
                <bpmndi:BPMNLabel>
                    <dc:Bounds x="908" y="81" width="17" height="40" />
                </bpmndi:BPMNLabel>
            </bpmndi:BPMNEdge>
        </bpmndi:BPMNPlane>
    </bpmndi:BPMNDiagram>
</bpmn:definitions>
```
....

.Transaction creation diagram
[bpmn, generated/architecture/process/scheduled-transaction, svg]
....
```bpmn
<?xml version="1.0" encoding="UTF-8"?>
<bpmn:definitions xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" id="Definitions_15wd9h4" targetNamespace="http://bpmn.io/schema/bpmn" exporter="Camunda Modeler" exporterVersion="5.17.0">
    <bpmn:process id="ScheduledTransaction" name="ScheduledTransaction" isExecutable="true" camunda:versionTag="1.0.0" camunda:historyTimeToLive="P1000D">
        <bpmn:extensionElements>
            <camunda:executionListener delegateExpression="${startProcessListener}" event="start" />
        </bpmn:extensionElements>
        <bpmn:startEvent id="StartEvent_1">
            <bpmn:outgoing>SequenceFlow_1kq9igm</bpmn:outgoing>
        </bpmn:startEvent>
        <bpmn:endEvent id="EndEvent_0x5zcld">
            <bpmn:incoming>Flow_1c1550o</bpmn:incoming>
        </bpmn:endEvent>
        <bpmn:sequenceFlow id="SequenceFlow_1kq9igm" sourceRef="StartEvent_1" targetRef="st_generate_json" />
        <bpmn:serviceTask id="st_generate_json" name="Generate transaction JSON" camunda:modelerTemplate="com.jongsoft.finance.bpmn.delegate.scheduler.GenerateTransactionJsonDelegate" camunda:modelerTemplateVersion="1" camunda:delegateExpression="${generateTransactionJsonDelegate}">
            <bpmn:extensionElements>
                <camunda:inputOutput>
                    <camunda:inputParameter name="id">${id}</camunda:inputParameter>
                    <camunda:inputParameter name="scheduled">${scheduled}</camunda:inputParameter>
                    <camunda:outputParameter name="sourceId">${sourceId}</camunda:outputParameter>
                    <camunda:outputParameter name="destinationId">${destinationId}</camunda:outputParameter>
                    <camunda:outputParameter name="transaction">${transaction}</camunda:outputParameter>
                </camunda:inputOutput>
            </bpmn:extensionElements>
            <bpmn:incoming>SequenceFlow_1kq9igm</bpmn:incoming>
            <bpmn:outgoing>Flow_1ihutev</bpmn:outgoing>
        </bpmn:serviceTask>
        <bpmn:sequenceFlow id="Flow_1ihutev" sourceRef="st_generate_json" targetRef="Task_1cm5fk9" />
        <bpmn:serviceTask id="sp_call_apply_rules" name="Apply rules" camunda:modelerTemplate="com.jongsoft.finance.bpmn.delegate.rule.TransactionRuleMatcherDelegate" camunda:modelerTemplateVersion="1" camunda:delegateExpression="${transactionRuleMatcherDelegate}">
            <bpmn:extensionElements>
                <camunda:inputOutput>
                    <camunda:inputParameter name="transactionId">${transactionId}</camunda:inputParameter>
                </camunda:inputOutput>
            </bpmn:extensionElements>
            <bpmn:incoming>Flow_1nftiai</bpmn:incoming>
            <bpmn:outgoing>Flow_1v7le45</bpmn:outgoing>
        </bpmn:serviceTask>
        <bpmn:sequenceFlow id="Flow_1v7le45" sourceRef="sp_call_apply_rules" targetRef="st_detect_duplicates" />
        <bpmn:serviceTask id="Task_1cm5fk9" name="Create transaction" camunda:modelerTemplate="com.jongsoft.finance.bpmn.delegate.scheduler.CreateTransactionDelegate" camunda:modelerTemplateVersion="1" camunda:delegateExpression="${createTransactionDelegate}">
            <bpmn:extensionElements>
                <camunda:inputOutput>
                    <camunda:inputParameter name="batchImportSlug" />
                    <camunda:inputParameter name="accountId">${destinationId}</camunda:inputParameter>
                    <camunda:inputParameter name="targetAccount">${sourceId}</camunda:inputParameter>
                    <camunda:inputParameter name="transaction">${transaction}</camunda:inputParameter>
                    <camunda:outputParameter name="transactionId">${transactionId}</camunda:outputParameter>
                </camunda:inputOutput>
            </bpmn:extensionElements>
            <bpmn:incoming>Flow_1ihutev</bpmn:incoming>
            <bpmn:outgoing>Flow_1nftiai</bpmn:outgoing>
        </bpmn:serviceTask>
        <bpmn:sequenceFlow id="Flow_1nftiai" sourceRef="Task_1cm5fk9" targetRef="sp_call_apply_rules" />
        <bpmn:serviceTask id="st_detect_duplicates" name="Detect duplicates" camunda:modelerTemplate="com.jongsoft.finance.bpmn.delegate.scheduler.DuplicateTransactionFinderDelegate" camunda:modelerTemplateVersion="1" camunda:delegateExpression="${duplicateTransactionFinderDelegate}">
            <bpmn:extensionElements>
                <camunda:inputOutput>
                    <camunda:inputParameter name="transactionId">${transactionId}</camunda:inputParameter>
                </camunda:inputOutput>
            </bpmn:extensionElements>
            <bpmn:incoming>Flow_1v7le45</bpmn:incoming>
            <bpmn:outgoing>Flow_1c1550o</bpmn:outgoing>
        </bpmn:serviceTask>
        <bpmn:sequenceFlow id="Flow_1c1550o" sourceRef="st_detect_duplicates" targetRef="EndEvent_0x5zcld" />
    </bpmn:process>
    <bpmndi:BPMNDiagram id="BPMNDiagram_1">
        <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="ScheduledTransaction">
            <bpmndi:BPMNShape id="_BPMNShape_StartEvent_2" bpmnElement="StartEvent_1">
                <dc:Bounds x="148" y="81" width="36" height="36" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="EndEvent_0x5zcld_di" bpmnElement="EndEvent_0x5zcld">
                <dc:Bounds x="1023" y="81" width="36" height="36" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="Activity_05tttla_di" bpmnElement="st_generate_json">
                <dc:Bounds x="280" y="59" width="100" height="80" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="Activity_0s3t60j_di" bpmnElement="sp_call_apply_rules">
                <dc:Bounds x="670" y="59" width="100" height="80" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="Activity_0cfjnw8_di" bpmnElement="Task_1cm5fk9">
                <dc:Bounds x="470" y="59" width="100" height="80" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNShape id="Activity_1x4vt1q_di" bpmnElement="st_detect_duplicates">
                <dc:Bounds x="850" y="59" width="100" height="80" />
            </bpmndi:BPMNShape>
            <bpmndi:BPMNEdge id="SequenceFlow_1kq9igm_di" bpmnElement="SequenceFlow_1kq9igm">
                <di:waypoint x="184" y="99" />
                <di:waypoint x="280" y="99" />
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="Flow_1ihutev_di" bpmnElement="Flow_1ihutev">
                <di:waypoint x="380" y="99" />
                <di:waypoint x="470" y="99" />
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="Flow_1v7le45_di" bpmnElement="Flow_1v7le45">
                <di:waypoint x="770" y="99" />
                <di:waypoint x="850" y="99" />
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="Flow_1nftiai_di" bpmnElement="Flow_1nftiai">
                <di:waypoint x="570" y="99" />
                <di:waypoint x="670" y="99" />
            </bpmndi:BPMNEdge>
            <bpmndi:BPMNEdge id="Flow_1c1550o_di" bpmnElement="Flow_1c1550o">
                <di:waypoint x="950" y="99" />
                <di:waypoint x="1023" y="99" />
            </bpmndi:BPMNEdge>
        </bpmndi:BPMNPlane>
    </bpmndi:BPMNDiagram>
</bpmn:definitions>
```
....
