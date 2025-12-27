// Quick Backend Test Script
// Open browser console on http://localhost:8081/aurahealth/ and paste this

console.log('🔧 Starting Backend Integration Tests...\n');

const API_BASE = '/aurahealth/api';

async function runAllTests() {
    console.log('═══════════════════════════════════════');
    console.log('TEST 1: POST Medicine to Backend');
    console.log('═══════════════════════════════════════');

    try {
        const payload = {
            user: 'Samarth',
            tabletName: 'Test Vitamin D',
            mealType: 'AFTER_BREAKFAST',
            time: '09:30',
            stock: 15
        };

        console.log('📤 Sending:', payload);

        const response = await fetch(`${API_BASE}/medicines`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload)
        });

        console.log('📥 Status:', response.status);

        if (response.ok) {
            const data = await response.json();
            console.log('✅ SUCCESS! Saved medicine:', data);
        } else {
            const error = await response.text();
            console.error('❌ FAILED:', error);
        }
    } catch (error) {
        console.error('❌ ERROR:', error.message);
    }

    console.log('\n═══════════════════════════════════════');
    console.log('TEST 2: GET Medicines from Backend');
    console.log('═══════════════════════════════════════');

    try {
        const response = await fetch(`${API_BASE}/medicines/today?user=Samarth`);
        console.log('📥 Status:', response.status);

        if (response.ok) {
            const data = await response.json();
            console.log(`✅ SUCCESS! Loaded ${data.length} medicines:`, data);
        } else {
            console.error('❌ FAILED');
        }
    } catch (error) {
        console.error('❌ ERROR:', error.message);
    }

    console.log('\n═══════════════════════════════════════');
    console.log('TEST 3: AI Chat Backend');
    console.log('═══════════════════════════════════════');

    try {
        const response = await fetch(`${API_BASE}/ai/chat`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ message: 'Hello AI!', user: 'Samarth' })
        });

        console.log('📥 Status:', response.status);

        if (response.ok) {
            const data = await response.json();
            console.log('✅ SUCCESS! AI replied:', data.reply);
        } else {
            console.error('❌ FAILED');
        }
    } catch (error) {
        console.error('❌ ERROR:', error.message);
    }

    console.log('\n═══════════════════════════════════════');
    console.log('✅ ALL TESTS COMPLETE!');
    console.log('═══════════════════════════════════════\n');
}

runAllTests();
