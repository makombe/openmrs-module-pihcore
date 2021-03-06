
<!-- TODO: are we currently using this?  can we delete? -->

<div class="header" ng-include="'templates/encounters/defaultEncounterHeader.page'">
</div>

<!-- TODO localize this once we finalize on format -->

<div class="content">
    <p>
        <label>Family History:</label>
        <span ng-repeat="obs in encounter.obs | byConcept:Concepts.familyHistoryConstruct | withCodedMember:Concepts.familyHistoryPresence:Concepts.yes">
            {{ obs | groupMember:Concepts.familyHistoryDiagnosis | obs:"value" }}
            ({{ obs | groupMember:Concepts.familyHistoryRelative | obs:"value" }})
            {{ obs | groupMember:Concepts.familyHistoryComments | obs:"value" }}
            {{ \$last ? "" : "," }}
        </span>
    </p>

    <p>
        <label>Antecedents personnels / habitudes:</label>
        <span ng-repeat="obs in encounter.obs | byConcept:Concepts.pastMedicalHistoryConstruct | withCodedMember:Concepts.pastMedicalHistoryPresence:Concepts.yes">
            {{ obs | groupMember:Concepts.pastMedicalHistoryFinding | obs:"value" }}
            {{ obs | groupMember:Concepts.pastMedicalHistoryComment | obs:"value" | wrapWith:"(":")" }}
            {{ \$last ? "" : "," }}
        </span>
    </p>

    <div class="book-keeping" ng-include="'templates/encounters/defaultEncounterBookkeeping.page'"></div>
</div>